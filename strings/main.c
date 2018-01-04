#include <stdio.h>

typedef unsigned long long usize64;
typedef unsigned short usize16;

usize64 bstrlen(const char*);
usize64 bstrcmatch(const char*, const char);
usize16 bstrncmp(const char*, const char*, usize64);
void bstrcpy(char*, const char*);
void bstrcat(char*, const char*);

int main() {
	printf("bstrlen(\"I like this string\") = %lld\n",bstrlen("I like this string"));
	printf("bstrcmatch(\"Abcdefg\",\'d\') = %lld\n",bstrcmatch("Abcdefg",'d'));
	printf("bstrncmp(\"kiao\",\"kiao\",4) = %d\n",bstrncmp("kiao","kiao",4));
	printf("bstrncmp(\"kioo\",\"kiao\",4) = %d\n",bstrncmp("kioo","kiao",4));
	printf("bstrncmp(\"kixao\",\"kiao\",5) = %d\n",bstrncmp("kixao","kiao",5));
	printf("bstrncmp(\"kiaooo\",\"kiao\",4) = %d\n",bstrncmp("kiaooo","kiao",4));
	printf("bstrncmp(\"kiao\",\"kiaooo\",4) = %d\n",bstrncmp("kiao","kiaooo",4));
	
	char loc[256];
	char loc0[] = "kiaoncino";
	bstrcpy(loc, loc0);
	printf("bstrcpy(loc,loc0): loc = %s, loc0 = %s\n",loc,loc0);

	bstrcat(loc, "kiaoneeeelollolloso");
	printf("bstrcat(loc,\"kiaoneeeelollolloso\"): loc = %s\n",loc);

	return 0;
}
