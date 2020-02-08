#include<stdio.h>
#define N 9
#define MIN 0
#define MAX 5300

//#define DEBUG
#ifndef TEST_LOOP
	#define TEST_LOOP 1
#endif

void init_list(int *list, int num)
{
	int i,j;
	int new_value;
	int flag = 0;
	for(i=0; i<num; i++) {
		// find a new number
		do{
			flag = 1;
			new_value = (rand() % (MAX-MIN)) +MIN;
			for(j=0;j<i;j++)
			{
				if(new_value==list[j]) {
					flag = 0;
					break;
				}
			}
		} while(flag == 0);
		list[i] = new_value;
	}
}

int split(int *arr, int low, int high)
{
	int value = arr[low];
	int temp;
	int i,j;
	i = low;
	j = high;
	
	while( i!=j ){ //if they does not meet, continue with moving.
		//step-1: right-hand man go to left, at the same time, left-hand man does not move.
		while(j>i){
			if(value < arr[j]){
				j--;
			}else{
				temp = arr[j];
				arr[j] = value;
				arr[i] = temp;
				i++;
				break;
			}
		}

		//step-2: left-hand man go to right, at the same time, right-hand man does not move.
		while( i<j ){
			if(arr[i] < value){
				i++;
			} else {
				temp = arr[i];
				arr[i] = value;
				arr[j] = temp;
				j--;
				break;
			}
		};
	}
	return i;
}

void print_list(int *list, int low, int high, char *marker, int index)
{
	int i;
	printf("%s (%d) : ", marker, index);
	for(i=low; i<=high; i++)
	{
		printf("%d  ", list[i]);
	}
	printf("\n");
}

void quick_sort(int *array, int low, int high, int round)
{
	if(low >= high){
		return;
	}
	
	int position;
	position = split(array, low, high);
	#ifdef DEBUG
		print_list(array, low, high, "Split", round+1);
	#endif
	quick_sort(array, low, position-1, round+1);
	#ifdef DEBUG
		print_list(array, low, position-1, "Left", round+1);
	#endif
	quick_sort(array, position+1, high, round+1);
	#ifdef DEBUG
		print_list(array, position+1, high, "Right", round+1);
	#endif
}
		
int check_list(int *array, int num)
{
	int i;
	int small = array[0];
	for(i=1; i<num; i++)
	{
		if(array[i] < small) {
			return 1;
		}
		small = array[i];
	}
	return 0;
}

int main(void)
{
	int err = 0;
	int test_loop;
	int list[N];

	for(test_loop=0; test_loop<TEST_LOOP; test_loop++)
	{
		init_list(list, N);
		#ifdef DEBUG
			print_list(list, 0, N-1, "Original", 0);
		#endif
		quick_sort(list, 0, N-1, 0);
		#ifdef DEBUG
			print_list(list, 0, N-1, "Result", 0);
		#endif
		if( check_list(list, N) )
		{
			err = 1;
			break;
		}

		#if (TEST_LOOP>100)
			if((test_loop+1)%(TEST_LOOP/100) == 0)
			{
				printf("%4.2f%% test passed!\n", ((test_loop+1)*100.0)/TEST_LOOP);
			}
		#else
			printf("%4.2f%% test passed!\n", ((test_loop+1)*100.0)/TEST_LOOP);
		#endif
	}

	if( err ) {
		printf("test-%d\n", test_loop);
	} else {
		printf("test pass, %d tests in total!\n", TEST_LOOP);
	}
	return 0;
}
