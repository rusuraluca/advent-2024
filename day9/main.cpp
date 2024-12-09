#include <iostream>
#include <vector>
using namespace std;

const int ROWS = 5;
const int COLS = 5;

vector<vector<int>> maze = {
    {0, 1, 0, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 0, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 0, 0}
};

pair<int, int> start = {0, 0};
pair<int, int> finish = {4, 4};

bool dfs(vector<vector<int>>& maze, int x, int y, vector<vector<bool>>& visited, vector<pair<int, int>>& path) {
    if (x == finish.first && y == finish.second) {
        path.push_back({x, y});
        return true;
    }

    if (x < 0 || y < 0 || x >= ROWS || y >= COLS || maze[x][y] == 1 || visited[x][y])
        return false;

    visited[x][y] = true;
    path.push_back({x, y});

    if (dfs(maze, x - 1, y, visited, path) ||
        dfs(maze, x, y + 1, visited, path) ||
        dfs(maze, x + 1, y, visited, path) ||
        dfs(maze, x, y - 1, visited, path)) {
        return true;
    }

    path.pop_back();
    return false;
}

int main() {
    vector<vector<bool>> visited(ROWS, vector<bool>(COLS, false));

    vector<pair<int, int>> path;

    if (dfs(maze, start.first, start.second, visited, path)) {
        cout << "Path found:\n";
        for (auto [x, y] : path) {
            cout << "(" << x << ", " << y << ") ";
        }
        cout << endl;
    } else {
        cout << "No path found.\n";
    }

    return 0;
}
