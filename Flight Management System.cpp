#include<iostream>
#include"bst.h"
#include"avl.h"
#include"bfs.h"
#include<chrono>
using namespace std;
using namespace chrono;

// Tree Structure Comparison
void CompareTreeStructures(BST& bst, AVL& avl)
{
	cout << "\n|------------------------------------------------------|\n";
	cout << "|       BST vs AVL TREE STRUCTURE COMPARISON           |\n";
	cout << "|------------------------------------------------------| \n";

	bst.VisualizeBST();
	cout << "\n\n";
	avl.VisualizeAVL();
}

// ============= SEARCH TIME COMPARISON FUNCTIONS =============
double measureBSTSearch(BST& bst, int id, int iterations = 1000)
{
	auto start = high_resolution_clock::now();
	for (int i = 0; i < iterations; i++)
	{
		bst.SearchByID(id);
	}
	auto end = high_resolution_clock::now();
	duration<double, micro> elapsed = end - start;
	return elapsed.count() / iterations;
}

double measureAVLSearch(AVL& avl, int id, int iterations = 1000)
{
	auto start = high_resolution_clock::now();
	for (int i = 0; i < iterations; i++)
	{
		avl.Search(id);
	}
	auto end = high_resolution_clock::now();
	duration<double, micro> elapsed = end - start;
	return elapsed.count() / iterations;
}

void CompareSearchTimes(BST& bst, AVL& avl)
{
	int id;
	cout << "\n========== BST vs AVL Search Time Comparison ==========\n";
	cout << "Enter Flight ID to search: ";
	cin >> id;

	TreeNode* bstNode = bst.SearchByID(id);
	Node* avlNode = avl.Search(id);

	if (!bstNode && !avlNode)
	{
		cout << "Flight ID " << id << " not found in either tree!\n";
		return;
	}

	cout << "\nPerforming 1000 searches for Flight ID " << id << "...\n\n";

	double bstTime = measureBSTSearch(bst, id);
	double avlTime = measureAVLSearch(avl, id);

	cout << "Results:\n";
	cout << "-----------------------------------------------------------\n";
	cout << "BST Search Time (avg): " << fixed << bstTime << " microseconds\n";
	cout << "AVL Search Time (avg): " << fixed << avlTime << " microseconds\n";
	cout << "-----------------------------------------------------------\n";

	if (avlTime > bstTime)
	{
		double speedup = ((bstTime / avlTime) - 1) * 100;
		cout << "AVL is " << fixed << speedup << "% FASTER than BST\n";
	}
	else if (bstTime > avlTime)
	{
		double speedup = ((avlTime / bstTime) - 1) * 100;
		cout << "BST is " << fixed << speedup << "% FASTER than AVL\n";
	}
	else
	{
		cout << "Both have similar performance\n";
	}

	cout << "\nAnalysis:\n";
	cout << "- BST can have O(n) worst case when unbalanced\n";
	cout << "- AVL guarantees O(log n) search time\n";
	cout << "- AVL rotations: " << avl.GetRotationCount() << " (maintains balance)\n";
	cout << "===========================================================\n";
}


// ======================== BST MENU ========================================
void bstMenu(BST& bst)
{
	int choice;
	do
	{
		cout << "\n========== FLIGHT DATABASE (BST) ==========\n";
		cout << "1. Add New Flight\n";
		cout << "2. Search Flight by ID\n";
		cout << "3. Delete Flight\n";
		cout << "4. Display All Flights\n";
		cout << "5. Display BST Structure\n";
		cout << "6. Search by Destination\n";
		cout << "7. Display by Status\n";
		cout << "8. Display ETA\n";
		cout << "9. Save to File\n";
		cout << "0. Back to Main Menu\n";
		cout << "===========================================\n";
		cout << "Enter choice: ";
		cin >> choice;

		switch (choice)
		{
		case 1:
		{
			ItemType item;
			int id, dur;
			string time, status, dest;

			cout << "\n--- Add New Flight ---\n";
			cout << "Flight ID: ";
			cin >> id;
			item.SetID(id);

			cout << "Departure Time (HH:MM): ";
			cin >> time;
			item.SetTime(time);

			cout << "Duration (hours): ";
			cin >> dur;
			item.SetDuration(dur);

			cout << "Status: "; cin.ignore();
			getline(cin, status);
			if (status.empty()) status = "Scheduled";
			item.SetStatus(status);

			cout << "Destination: ";
			getline(cin, dest);
			item.SetDestination(dest);

			bst.InsertNode(item);
			break;
		}
		case 2:
		{
			int id;
			cout << "Enter Flight ID: ";
			cin >> id;
			TreeNode* node = bst.SearchByID(id);
			if (node)
			{
				cout << "\nFlight Found:\n";
				cout << "ID: " << node->key.GetID() << endl;
				cout << "Time: " << node->key.GetTime() << endl;
				cout << "Duration: " << node->key.GetDuration() << "h\n";
				cout << "Status: " << node->key.GetStatus() << endl;
				cout << "Destination: " << node->key.GetDestination() << endl;
			}
			else
				cout << "x Flight not found!\n";
			break;
		}
		case 3:
		{
			int id;
			cout << "Enter Flight ID to delete: ";
			cin >> id;
			bst.DeleteNode(id);
			break;
		}
		case 4:
			bst.DisplayTree();
			break;
		case 5:
			bst.VisualizeBST();
			break;
		case 6:
		{
			string dest;
			cout << "Enter destination: ";
			cin.ignore();
			getline(cin, dest);
			bst.SearchByDestination(dest);
			break;
		}
		case 7:
		{
			string status;
			cout << "Enter status: ";
			cin.ignore();
			getline(cin, status);
			bst.DisplayByStatus(status);
			break;
		}
		case 8:
		{
			int id;
			cout << "Enter Flight ID: ";
			cin >> id;
			bst.DisplayByETA(id);
			break;
		}
		case 9:
			bst.SaveToFile("flights.txt");
			break;
		case 0:
			cout << "Returning to main menu...\n";
			break;
		default:
			cout << "Invalid choice!\n";
		}
	}
	while (choice != 0);
}


// ================================== AVL MENU =========================================
void avlMenu(AVL& avl)
{
	int choice;
	do
	{
		cout << "\n========== FLIGHT DATABASE (AVL) ==========\n";
		cout << "1. Add New Flight\n";
		cout << "2. Search Flight by ID\n";
		cout << "3. Delete Flight\n";
		cout << "4. Display All Flights + Rotation Info\n";
		cout << "5. Display AVL Tree Structure\n";
		cout << "6. Search by Destination\n";
		cout << "7. Display by Status\n";
		cout << "8. Display ETA\n";
		cout << "9. Display Tree Statistics\n";
		cout << "10. Save to File\n";
		cout << "0. Back to Main Menu\n";
		cout << "===========================================\n";
		cout << "Enter choice: ";
		cin >> choice;

		switch (choice)
		{
		case 1:
		{
			ItemClass item;
			int id, dur;
			string time, status, dest;

			cout << "\n--- Add New Flight ---\n";
			cout << "Flight ID: ";
			cin >> id;
			item.SetID(id);

			cout << "Departure Time (HH:MM): ";
			cin >> time;
			item.SetTime(time);

			cout << "Duration (hours): ";
			cin >> dur;
			item.SetDuration(dur);

			cout << "Status: "; cin.ignore();
			getline(cin, status);
			if (status.empty()) status = "Scheduled";
			item.SetStatus(status);

			cout << "Destination: ";
			getline(cin, dest);
			item.SetDestination(dest);

			avl.Insert(item);
			break;
		}
		case 2:
		{
			int id;
			cout << "Enter Flight ID: ";
			cin >> id;
			Node* node = avl.Search(id);
			if (node)
			{
				cout << "\n✓ Flight Found:\n";
				cout << "ID: " << node->info.GetID() << endl;
				cout << "Time: " << node->info.GetTime() << endl;
				cout << "Duration: " << node->info.GetDuration() << "h\n";
				cout << "Status: " << node->info.GetStatus() << endl;
				cout << "Destination: " << node->info.GetDestination() << endl;
			}
			else
				cout << "x Flight not found!\n";
			break;
		}
		case 3:
		{
			int id;
			cout << "Enter Flight ID to delete: ";
			cin >> id;
			avl.Delete(id);
			break;
		}
		case 4:
			avl.Display();
			break;
		case 5:
			avl.VisualizeAVL();
			break;
		case 6:
		{
			string dest;
			cout << "Enter destination: ";
			cin.ignore();
			getline(cin, dest);
			avl.SearchByDestination(dest);
			break;
		}
		case 7:
		{
			string status;
			cout << "Enter status: ";
			cin.ignore();
			getline(cin, status);
			avl.DisplayByStatus(status);
			break;
		}
		case 8:
		{
			int id;
			cout << "Enter Flight ID: ";
			cin >> id;
			avl.DisplayETA(id);
			break;
		}
		case 9:
		{
			Node* root = avl.GetRoot();
			cout << "\n========== AVL Tree Statistics ==========\n";
			cout << "Tree Height      : " << (root ? root->height : 0) << endl;
			cout << "Total Rotations  : " << avl.GetRotationCount() << endl;
			cout << "Tree Status      : " << (root ? "NOT Empty" : "Empty") << endl;
			cout << "=========================================\n";
			break;
		}
		case 10:
			avl.SaveToFile("flights_avl.txt");
			break;
		case 0:
			cout << "Returning to main menu...\n";
			break;
		default:
			cout << "Invalid choice!\n";
		}
	}
	while (choice != 0);
}


// ==================================== BFS MENU =========================================
void bfsMenu(Graph& graph)
{
	int choice;
	do
	{
		cout << "\n========== TRIP PLANNING (BFS) ==========\n";
		cout << "1. Display All Airports\n";
		cout << "2. Plan Trip (Find Minimum Stops)\n";
		cout << "3. Display BFS Traversal Table\n";
		cout << "4. Load Airports from File\n";
		cout << "5. Load Routes from File\n";
		cout << "0. Back to Main Menu\n";
		cout << "=========================================\n";
		cout << "Enter choice: ";
		cin >> choice;

		switch (choice)
		{
		case 1:
			graph.DisplayAirports();
			break;
		case 2:
		{
			int source, dest;
			cout << "\n--- Plan Trip ---\n";
			cout << "Enter Source Airport ID: ";
			cin >> source;
			cout << "Enter Destination Airport ID: ";
			cin >> dest;
			graph.FindMinimumStops(source, dest);
			break;
		}
		case 3:
		{
			int source;
			cout << "Enter Source Airport ID for BFS: "; cin >> source;
			graph.BFS(source);
			graph.DisplayBFStable();
			break;
		}
		case 4:
			graph.LoadAirports("airports.txt");
			break;
		case 5:
			graph.LoadRoutes("routes.txt");
			break;
		case 0:
			cout << "Returning to main menu...\n";
			break;
		default:
			cout << "Invalid choice!\n";
		}
	} while (choice != 0);
}


// ============================== MAIN PTROGRAM =============================
int main()
{
	BST bstflights;
	AVL avlflights;
	Graph flightNetwork;
	// initialize all data structures

	// Load initial data
	cout << "Loading Flight Management System...\n";
	bstflights.LoadFromFile("flights.txt");
	avlflights.LoadFromFile("flights.txt");
	flightNetwork.LoadAirports("airports.txt");
	flightNetwork.LoadRoutes("routes.txt");
	cout << "System loaded successfully!\n";

	int choice;
	do
	{
		cout << "\n";
		cout << "|----------------------------------------------------|\n";
		cout << "|      FLIGHT MANAGEMENT SYSTEM - MAIN MENU          |\n";
		cout << "|----------------------------------------------------|\n";
		cout << "  1. Flight Database (BST)\n";
		cout << "  2. Flight Database (AVL)\n";
		cout << "  3. Trip Planning (BFS - Graph)\n";
		cout << "  4. Compare Tree Structures (BST vs AVL)\n";
		cout << "  5. Compare Search Times(BST vs AVL)\n";
		cout << "  6. Display All Systems Side-by-Side\n";
		cout << "  0. Exit System\n";
		cout << "-------------------------------------------------------\n";
		cout << "Enter your choice: ";
		cin >> choice;

		switch (choice)
		{
		case 1:
			bstMenu(bstflights);
			break;
		case 2:
			avlMenu(avlflights);
			break;
		case 3:
			bfsMenu(flightNetwork);
			break;
		case 4:
			CompareTreeStructures(bstflights,avlflights);
			break;
		case 5:
			CompareSearchTimes(bstflights, avlflights);
			break;
		case 6:
		{
			flightNetwork.LoadAirports("airports.txt");
			cout << "\n========== BST FLIGHTS ==========\n";
			bstflights.DisplayTree();
			cout << "\n========== AVL FLIGHTS ==========\n";
			avlflights.Display();
			cout << "\n========== FLIGHT NETWORK ==========\n";
			flightNetwork.DisplayAirports();
			break;
		}
		case 0:
		{
			cout << "\nSaving all data...\n";
			bstflights.SaveToFile("flights.txt");
			avlflights.SaveToFile("flights_avl.txt");
			cout << "--------------------------------------------------\n";
			cout << "  Thank you for using Flight Management System!\n";
			cout << "--------------------------------------------------\n";
			break;
		}
		default:
			cout << "Invalid choice! Please Try Again.\n";
		}
	} while (choice != 0);

	return 0;
}
