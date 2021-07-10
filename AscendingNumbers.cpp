/*
A program to check the nearest lower number with ascending digits
Input: 23245	Output: 22999
Input: 11235888 Output: 11235888
Input: 111110	Output: 99999
Input: 33245	Output: 29999
*/

#include <iostream>
#include <string>
#include <vector>
#include <math.h>

using namespace std;

//check if the digits are ascending by converting to vector of integer
bool checkAscending(int numberVal) {
	//Get denominator of 10^n
	int max_pow = 0;
	while (1) {
		int denumerator = pow(10, max_pow);
		int temp = numberVal / (int)pow(10, max_pow);
		max_pow++;
		if (temp < 1) {
			break;
		}
	}
	max_pow -= 2;

	//check if the digits are ascending
	vector<int> digits;		// to save all the digits

	int temp = 0;
	digits.push_back(numberVal / pow(10, max_pow));
	while (1) {
		temp = numberVal % int(pow(10, max_pow));
		max_pow--;
		digits.push_back(temp / pow(10, max_pow));
		if (max_pow == 0) {
			break;
		}
	}

	bool ascending = true;
	int iter = 0;
	while (iter < (digits.size() - 1)) {
		if (!(digits[iter] <= digits[iter + 1])) {
			cout << "Not ascending" << endl;
			ascending = false;
			break;
		}
		iter++;
	}
	return ascending;
}

int main()
{
	cout << "Start program for checking the nearest ascending number" << endl;
	const int max_char = 20;
	int total_char = 0;
	char input_num[max_char];
	
	cout << "Please input numbers 0-9 = ";
	cin.getline(input_num, sizeof(input_num));
	cout <<"Inputted number is = " << input_num << endl;

	//Find EOL
	for (int i = 0; i < max_char; i++) {
		if (input_num[i] == '\0') {
			total_char = i;
		}
	}
	
	//Validate input
	bool validation = true;
	for (int i = 0; i < total_char; i++) {
		if ((input_num[i] != '0') & (input_num[i] != '1') & (input_num[i] != '2')
			& (input_num[i] != '3') & (input_num[i] != '4') & (input_num[i] != '5') & (input_num[i] != '6') & (input_num[i] != '7') & (input_num[i] != '8') & (input_num[i] != '9')) {
			validation = false;
		}
		if (validation == false) {
			cout << "Unrecognized input!" << endl;
			exit(1);
		}
	}

	//Convert to integer
	int numberVal = atoi(input_num);
	
	int num_find = numberVal;
	while(1){
		bool ascending = checkAscending(num_find);
		if (ascending == 1) {
			break;
		}
		num_find--;
	}

	cout << "Final val = " << num_find << endl;
	
	cout << "End of program" << endl;
}
