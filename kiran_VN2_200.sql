SELECT "user_id" ,COUNT("Post_id") FROM POST_DATA GROUP BY "user_id";


SELECT "user_id",num_of_posts FROM (SELECT "user_id",COUNT("Post_id") AS num_of_posts FROM POST_DATA
GROUP BY "user_id" ORDER BY NUM_OF_POSTS  DESC ) LIMIT 1;

select avg(co) as "Average post count" from (select count(post_id) as co from POST_DATA group by post_id ) ;

SELECT "Post_id", cnt AS max_cmnts FROM
(SELECT "Post_id",COUNT("Comment_id") AS cnt FROM COMMENT_DATA
GROUP BY "Post_id" ORDER BY cnt DESC) LIMIT 1;

SELECT "Post_id", cnt AS min_cmnts FROM
(SELECT "Post_id",COUNT("Comment_id") AS cnt FROM COMMENT_DATA
GROUP BY "Post_id" ORDER BY cnt ASC) LIMIT 1;

SELECT * FROM (SELECT USER_DATA."id",COUNT(POST_DATA."Post_id") AS pst_cnt
FROM POST_DATA FULL JOIN USER_DATA 
ON USER_DATA ."id" = POST_DATA."user_id" 
GROUP BY USER_DATA."id") 
WHERE pst_cnt=0

SELECT * FROM (SELECT "Post_id",COUNT("Comment_id") AS comment_cnt
FROM COMMENT_DATA   
GROUP BY "Post_id") 
WHERE comment_cnt=0


SELECT "id" FROM USER_DATA 
FULL JOIN POST_DATA ON USER_DATA."id" =POST_DATA."user_id" 
FULL JOIN  COMMENT_DATA ON POST_DATA."Post_id"=COMMENT_DATA."Post_id" 
WHERE COMMENT_DATA."Comments" =NULL;



