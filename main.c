/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/08 11:16:28 by nel-masr          #+#    #+#             */
/*   Updated: 2021/03/11 11:25:37 by nel-masr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "includes/libasm.h"

int	main(void)
{
	printf(GREEN"###FT_STRLEN###\n"STOP_COLOR);
	char *str; 
	
	str = "This is a test.";
	printf("ft_strlen : %d\n", (int)ft_strlen(str));
	printf("   strlen : %d\n", (int)strlen(str));
	str = "This is a very long test with a lot of characters and also weird ones like #$&*^*(\n\t ok I'm done now.";
	printf("ft_strlen : %d\n", (int)ft_strlen(str));
	printf("   strlen : %d\n", (int)strlen(str));
	str = "";
	printf("ft_strlen : %d\n", (int)ft_strlen(str));
	printf("   strlen : %d\n\n", (int)strlen(str));
	
	printf(GREEN"###FT_STRCPY###\n"STOP_COLOR);
	char *str1;
	char *str2;
	char *src;

	src = "bonjour";
	str1 = malloc(sizeof(char) * 1000);
	str2 = malloc(sizeof(char) * 1000);
	str1 = ft_strcpy(str1, src);
	str2 = strcpy(str2, src);
	printf("ft_strcpy: %s\n", str1);
	printf("   strcpy: %s\n", str2);
	str1 = ft_strcpy(str1, "I'm testing really long strings like 74377497 and *&^&&*&*(&.");
	str2 = strcpy(str2, "I'm testing really long strings like 74377497 and *&^&&*&*(&.");
	printf("ft_strcpy: %s\n", str1);
	printf("   strcpy: %s\n", str2);
	str1 = ft_strcpy(str1, "\n");
	str2 = strcpy(str2, "\n");
	printf("ft_strcpy: %s\n", str1);
	printf("   strcpy: %s\n", str2);
	str1 = ft_strcpy(str1, "");
	str2 =    strcpy(str2, "");
	printf("ft_strcpy: %s\n", str1);
	printf("   strcpy: %s\n\n", str2);
	free(str1);
	free(str2);

	printf(GREEN"###FT_STRCMP###\n"STOP_COLOR);
	printf("ft_strcmp: %d\n", ft_strcmp("hello", "hella"));
	printf("   strcmp: %d\n", strcmp("hello", "hella"));
	printf("ft_strcmp: %d\n", ft_strcmp("", "hella"));
	printf("   strcmp: %d\n", strcmp("", "hella"));
	printf("ft_strcmp: %d\n", ft_strcmp("hello", ""));
	printf("   strcmp: %d\n", strcmp("hello", ""));
	printf("ft_strcmp: %d\n", ft_strcmp("", ""));
	printf("   strcmp: %d\n", strcmp("", ""));
	printf("ft_strcmp: %d\n", ft_strcmp("An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son", "An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son"));
	printf("   strcmp: %d\n", strcmp("An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son", "An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son"));
	printf("ft_strcmp: %d\n", ft_strcmp("An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son", "An amazingly long string with a lot of characters and shiti37#$*((, fuck the patriarchy son"));
	printf("   strcmp: %d\n\n", strcmp("An amazingly long string with a lot of characters and shiti637#$*((, fuck the patriarchy son", "An amazingly long string with a lot of characters and shiti37#$*((, fuck the patriarchy son"));

	printf(GREEN"###FT_WRITE###"STOP_COLOR);
	printf("\n");
	char *s1 = "yo whatup | ";
	char *s2 = "unbelievably long string with a whole lot of weird characters like $*()*@#@:/ and numbers like 68667868610921382038291  | ";
	char *s3 = "";
	printf("ft_write: %zd\n", ft_write(1, s1, strlen(s1)));
	printf("   write: %zd\n", write(1, s1, strlen(s1)));
	printf("ft_write: %zd\n", ft_write(1, s2, strlen(s2)));
	printf("   write: %zd\n", write(1, s2, strlen(s2)));
	printf("ft_write: %zd\n", ft_write(1, s3, strlen(s3)));
	printf("   write: %zd\n", write(1, s3, strlen(s3)));
	printf("ft_write: %zd\n", ft_write(1, s2, 13));
	printf("   write: %zd\n", write(1, s2, 13));
	printf("ft_write: %zd\n", ft_write(-1, s2, 13));
	printf("ft_write (errno): %d\n", errno);
	errno = 0;
	printf("   write: %zd\n", write(-1, s2, 13));
	printf("   write (errno): %d\n\n", errno);
	errno = 0;
	
	printf(GREEN"###FT_READ###"STOP_COLOR);
	printf("\n");
	int	fd;
	char buf[150];
	ssize_t	ret;
	fd = open("example.txt", O_RDONLY);
	ret = ft_read(fd, buf, 150);
	buf[ret] = '\0';
	printf("ft_read :\n%sret = %zd\n", buf, ret);
	close(fd);
	fd = open("example.txt", O_RDONLY);
	ret = read(fd, buf, 150);
	buf[ret] = '\0';
	printf("   read :\n%sret = %zd\n\n", buf, ret);
	close(fd);

	char buf3[150];
	fd = open("example.txt", O_RDONLY);
	ret = ft_read(fd, buf3, 50);
	buf3[ret] = '\0';
	printf("ft_read :\n%s\nret = %zd\n", buf3, ret);
	close(fd);
	fd = open("example.txt", O_RDONLY);
	ret = read(fd, buf3, 50);
	buf3[ret] = '\0';
	printf("   read :\n%s\nret = %zd\n\n", buf3, ret);
	close(fd);

	char buf2[4096];
	fd = open("idonotexist.txt", O_RDONLY);
	ret = ft_read(fd, buf2, 150);
	printf("ft_read (errno) : %d\n", errno);
	buf2[ret] = '\0';
	printf("ft_read :\n%sret = %zd\n", buf2, ret);
	close(fd);
	errno = 0;
	fd = open("idonotexist.txt", O_RDONLY);
	ret = read(fd, buf2, 150);
	printf("   read (errno) : %d\n", errno);
	buf2[ret] = '\0';
	printf("   read :\n%sret = %zd\n\n", buf2, ret);
	close(fd);

	printf(GREEN"###FT_STRDUP###"STOP_COLOR);
	printf("\n");
	char *ft_dest;
	char *dest;

	ft_dest = ft_strdup("bonjour");
	dest = strdup("bonjour");
	printf("ft_strdup: %s\n", ft_dest);
	printf("   strdup: %s\n", dest);
	ft_dest = ft_strdup("I'm testing really long strings like 74377497 and *&^&&*&*(&.");
	dest = strdup("I'm testing really long strings like 74377497 and *&^&&*&*(&.");
	printf("ft_strdup: %s\n", ft_dest);
	printf("   strdup: %s\n", dest);
	ft_dest = ft_strdup("\n");
	dest = strdup("\n");
	printf("ft_strdup: %s\n", ft_dest);
	printf("   strdup: %s\n", dest);
	ft_dest = ft_strdup("");
	dest = strdup("");
	printf("ft_strdup: %s\n", ft_dest);
	printf("   strdup: %s\n\n", dest);
	free(ft_dest);
	free(dest);
}
