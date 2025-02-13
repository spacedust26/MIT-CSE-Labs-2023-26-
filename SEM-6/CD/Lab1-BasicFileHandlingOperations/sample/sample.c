// Program to copy contents of source file to destination file 

#include<stdio.h>
#include<stdlib.h>

int main(){
  FILE *fptr1, *fptr2;
  char filename[100], c;
  //Open the read file
  printf("Enter the file path to read from: ");
  scanf("%s", filename);
  fptr1 = fopen(filename, "r");
  if(fptr1 == NULL){
    printf("Cannot open the read file");
    exit(0);
  }
  //Open the write file
  printf("Enter the file path to write to: ");
  scanf("%s", filename);
  fptr2 = fopen(filename, "w+");
  if(fptr2 == NULL){
    printf("Cannot open the write file");
    exit(0);
  }
  //Copy contents
  c = fgetc(fptr1);
  while(c != EOF){
    fputc(c, fptr2);
    c = fgetc(fptr1);
  }
  printf("The contents of the file have been copied.\n");
  //Close files
  fclose(fptr1);
  fclose(fptr2);
  return 0;
}