                                       Table "public.account_user"
      Column      |           Type           |                         Modifiers                         
------------------+--------------------------+-----------------------------------------------------------
 id               | integer                  | not null default nextval('account_user_id_seq'::regclass)
 password         | character varying(128)   | not null
 last_login       | timestamp with time zone | 
 is_superuser     | boolean                  | not null
 username         | character varying(150)   | not null
 first_name       | character varying(30)    | not null
 last_name        | character varying(30)    | not null
 email            | character varying(254)   | not null
 is_staff         | boolean                  | not null
 is_active        | boolean                  | not null
 date_joined      | timestamp with time zone | not null
 organization     | character varying(255)   | not null
 organization_url | character varying(255)   | not null
 private          | boolean                  | not null
 address          | text                     | not null
 terms            | boolean                  | not null
 newsletter       | boolean                  | not null
 date_left        | timestamp with time zone | 
 is_deleted       | boolean                  | not null
 is_trusted       | boolean                  | not null
 is_blocked       | boolean                  | not null
Indexes:
    "account_user_pkey" PRIMARY KEY, btree (id)
    "account_user_username_key" UNIQUE CONSTRAINT, btree (username)
    "account_user_username_d393f583_like" btree (username varchar_pattern_ops)
Referenced by:
    TABLE "account_user_groups" CONSTRAINT "account_user_groups_user_id_14345e7b_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "account_user_user_permissions" CONSTRAINT "account_user_user_permissio_user_id_cc42d270_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_admin_log" CONSTRAINT "django_admin_log_user_id_c564eba6_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_comment_flags" CONSTRAINT "django_comment_flags_user_id_f3f81f0a_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_comments" CONSTRAINT "django_comments_user_id_a0a440a1_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foievent" CONSTRAINT "foirequest_foievent_user_id_cdabb4cd_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foimessage" CONSTRAINT "foirequest_foimessag_sender_user_id_1d8a451e_fk_account_user_id" FOREIGN KEY (sender_user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foirequest" CONSTRAINT "foirequest_foirequest_user_id_45ac55e3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_publicbodysuggestion" CONSTRAINT "foirequest_publicbodysugges_user_id_64bf5114_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequestfollower_foirequestfollower" CONSTRAINT "foirequestfollower_foireque_user_id_d7804ee3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "frontpage_featuredrequest" CONSTRAINT "frontpage_featuredrequest_user_id_3c4678a3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbody_publicbod__created_by_id_318937ec_fk_account_user_id" FOREIGN KEY (_created_by_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbody_publicbod__updated_by_id_255f09ac_fk_account_user_id" FOREIGN KEY (_updated_by_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "tastypie_apikey" CONSTRAINT "tastypie_apikey_user_id_8c8fa920_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

                          Table "public.account_user_groups"
  Column  |  Type   |                            Modifiers                             
----------+---------+------------------------------------------------------------------
 id       | integer | not null default nextval('account_user_groups_id_seq'::regclass)
 user_id  | integer | not null
 group_id | integer | not null
Indexes:
    "account_user_groups_pkey" PRIMARY KEY, btree (id)
    "account_user_groups_user_id_4d09af3e_uniq" UNIQUE CONSTRAINT, btree (user_id, group_id)
    "account_user_groups_0e939a4f" btree (group_id)
    "account_user_groups_e8701ad4" btree (user_id)
Foreign-key constraints:
    "account_user_groups_group_id_6c71f749_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED
    "account_user_groups_user_id_14345e7b_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.account_user_groups_0e939a4f"
  Column  |  Type   | Definition 
----------+---------+------------
 group_id | integer | group_id
btree, for table "public.account_user_groups"

Index "public.account_user_groups_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.account_user_groups"

     Sequence "public.account_user_groups_id_seq"
    Column     |  Type   |           Value            
---------------+---------+----------------------------
 sequence_name | name    | account_user_groups_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.account_user_groups.id

Index "public.account_user_groups_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.account_user_groups"

Index "public.account_user_groups_user_id_4d09af3e_uniq"
  Column  |  Type   | Definition 
----------+---------+------------
 user_id  | integer | user_id
 group_id | integer | group_id
unique, btree, for table "public.account_user_groups"

     Sequence "public.account_user_id_seq"
    Column     |  Type   |        Value        
---------------+---------+---------------------
 sequence_name | name    | account_user_id_seq
 last_value    | bigint  | 17627
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.account_user.id

Index "public.account_user_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.account_user"

                             Table "public.account_user_user_permissions"
    Column     |  Type   |                                 Modifiers                                  
---------------+---------+----------------------------------------------------------------------------
 id            | integer | not null default nextval('account_user_user_permissions_id_seq'::regclass)
 user_id       | integer | not null
 permission_id | integer | not null
Indexes:
    "account_user_user_permissions_pkey" PRIMARY KEY, btree (id)
    "account_user_user_permissions_user_id_48bdd28b_uniq" UNIQUE CONSTRAINT, btree (user_id, permission_id)
    "account_user_user_permissions_8373b171" btree (permission_id)
    "account_user_user_permissions_e8701ad4" btree (user_id)
Foreign-key constraints:
    "account_user_user__permission_id_66c44191_fk_auth_permission_id" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED
    "account_user_user_permissio_user_id_cc42d270_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.account_user_user_permissions_8373b171"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 permission_id | integer | permission_id
btree, for table "public.account_user_user_permissions"

Index "public.account_user_user_permissions_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.account_user_user_permissions"

     Sequence "public.account_user_user_permissions_id_seq"
    Column     |  Type   |                Value                 
---------------+---------+--------------------------------------
 sequence_name | name    | account_user_user_permissions_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.account_user_user_permissions.id

Index "public.account_user_user_permissions_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.account_user_user_permissions"

Index "public.account_user_user_permissions_user_id_48bdd28b_uniq"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 user_id       | integer | user_id
 permission_id | integer | permission_id
unique, btree, for table "public.account_user_user_permissions"

Index "public.account_user_username_d393f583_like"
  Column  |          Type          | Definition 
----------+------------------------+------------
 username | character varying(150) | username
btree, for table "public.account_user"

    Index "public.account_user_username_key"
  Column  |          Type          | Definition 
----------+------------------------+------------
 username | character varying(150) | username
unique, btree, for table "public.account_user"

                                Table "public.auth_group"
 Column |         Type          |                        Modifiers                        
--------+-----------------------+---------------------------------------------------------
 id     | integer               | not null default nextval('auth_group_id_seq'::regclass)
 name   | character varying(80) | not null
Indexes:
    "auth_group_pkey" PRIMARY KEY, btree (id)
    "auth_group_name_key" UNIQUE CONSTRAINT, btree (name)
    "auth_group_name_a6ea08ec_like" btree (name varchar_pattern_ops)
Referenced by:
    TABLE "account_user_groups" CONSTRAINT "account_user_groups_group_id_6c71f749_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "auth_group_permissions" CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED

      Sequence "public.auth_group_id_seq"
    Column     |  Type   |        Value        
---------------+---------+---------------------
 sequence_name | name    | auth_group_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.auth_group.id

Index "public.auth_group_name_a6ea08ec_like"
 Column |         Type          | Definition 
--------+-----------------------+------------
 name   | character varying(80) | name
btree, for table "public.auth_group"

     Index "public.auth_group_name_key"
 Column |         Type          | Definition 
--------+-----------------------+------------
 name   | character varying(80) | name
unique, btree, for table "public.auth_group"

                             Table "public.auth_group_permissions"
    Column     |  Type   |                              Modifiers                              
---------------+---------+---------------------------------------------------------------------
 id            | integer | not null default nextval('auth_group_permissions_id_seq'::regclass)
 group_id      | integer | not null
 permission_id | integer | not null
Indexes:
    "auth_group_permissions_pkey" PRIMARY KEY, btree (id)
    "auth_group_permissions_group_id_0cd325b0_uniq" UNIQUE CONSTRAINT, btree (group_id, permission_id)
    "auth_group_permissions_0e939a4f" btree (group_id)
    "auth_group_permissions_8373b171" btree (permission_id)
Foreign-key constraints:
    "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED
    "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED

Index "public.auth_group_permissions_0e939a4f"
  Column  |  Type   | Definition 
----------+---------+------------
 group_id | integer | group_id
btree, for table "public.auth_group_permissions"

Index "public.auth_group_permissions_8373b171"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 permission_id | integer | permission_id
btree, for table "public.auth_group_permissions"

Index "public.auth_group_permissions_group_id_0cd325b0_uniq"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 group_id      | integer | group_id
 permission_id | integer | permission_id
unique, btree, for table "public.auth_group_permissions"

     Sequence "public.auth_group_permissions_id_seq"
    Column     |  Type   |             Value             
---------------+---------+-------------------------------
 sequence_name | name    | auth_group_permissions_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.auth_group_permissions.id

Index "public.auth_group_permissions_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.auth_group_permissions"

Index "public.auth_group_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.auth_group"

                                     Table "public.auth_permission"
     Column      |          Type          |                          Modifiers                           
-----------------+------------------------+--------------------------------------------------------------
 id              | integer                | not null default nextval('auth_permission_id_seq'::regclass)
 name            | character varying(255) | not null
 content_type_id | integer                | not null
 codename        | character varying(100) | not null
Indexes:
    "auth_permission_pkey" PRIMARY KEY, btree (id)
    "auth_permission_content_type_id_01ab375a_uniq" UNIQUE CONSTRAINT, btree (content_type_id, codename)
    "auth_permission_417f1b1c" btree (content_type_id)
Foreign-key constraints:
    "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "account_user_user_permissions" CONSTRAINT "account_user_user__permission_id_66c44191_fk_auth_permission_id" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "auth_group_permissions" CONSTRAINT "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED

   Index "public.auth_permission_417f1b1c"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 content_type_id | integer | content_type_id
btree, for table "public.auth_permission"

Index "public.auth_permission_content_type_id_01ab375a_uniq"
     Column      |          Type          |   Definition    
-----------------+------------------------+-----------------
 content_type_id | integer                | content_type_id
 codename        | character varying(100) | codename
unique, btree, for table "public.auth_permission"

     Sequence "public.auth_permission_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | auth_permission_id_seq
 last_value    | bigint  | 92
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.auth_permission.id

Index "public.auth_permission_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.auth_permission"

                                      Table "public.django_admin_log"
     Column      |           Type           |                           Modifiers                           
-----------------+--------------------------+---------------------------------------------------------------
 id              | integer                  | not null default nextval('django_admin_log_id_seq'::regclass)
 action_time     | timestamp with time zone | not null
 object_id       | text                     | 
 object_repr     | character varying(200)   | not null
 action_flag     | smallint                 | not null
 change_message  | text                     | not null
 content_type_id | integer                  | 
 user_id         | integer                  | not null
Indexes:
    "django_admin_log_pkey" PRIMARY KEY, btree (id)
    "django_admin_log_417f1b1c" btree (content_type_id)
    "django_admin_log_e8701ad4" btree (user_id)
Check constraints:
    "django_admin_log_action_flag_check" CHECK (action_flag >= 0)
Foreign-key constraints:
    "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    "django_admin_log_user_id_c564eba6_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

  Index "public.django_admin_log_417f1b1c"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 content_type_id | integer | content_type_id
btree, for table "public.django_admin_log"

Index "public.django_admin_log_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.django_admin_log"

     Sequence "public.django_admin_log_id_seq"
    Column     |  Type   |          Value          
---------------+---------+-------------------------
 sequence_name | name    | django_admin_log_id_seq
 last_value    | bigint  | 18086
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_admin_log.id

Index "public.django_admin_log_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_admin_log"

                                    Table "public.django_comment_flags"
   Column   |           Type           |                             Modifiers                             
------------+--------------------------+-------------------------------------------------------------------
 id         | integer                  | not null default nextval('django_comment_flags_id_seq'::regclass)
 flag       | character varying(30)    | not null
 flag_date  | timestamp with time zone | not null
 comment_id | integer                  | not null
 user_id    | integer                  | not null
Indexes:
    "django_comment_flags_pkey" PRIMARY KEY, btree (id)
    "django_comment_flags_user_id_537f77a7_uniq" UNIQUE CONSTRAINT, btree (user_id, comment_id, flag)
    "django_comment_flags_327a6c43" btree (flag)
    "django_comment_flags_69b97d17" btree (comment_id)
    "django_comment_flags_e8701ad4" btree (user_id)
    "django_comment_flags_flag_8b141fcb_like" btree (flag varchar_pattern_ops)
Foreign-key constraints:
    "django_comment_flags_comment_id_d8054933_fk_django_comments_id" FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED
    "django_comment_flags_user_id_f3f81f0a_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.django_comment_flags_327a6c43"
 Column |         Type          | Definition 
--------+-----------------------+------------
 flag   | character varying(30) | flag
btree, for table "public.django_comment_flags"

Index "public.django_comment_flags_69b97d17"
   Column   |  Type   | Definition 
------------+---------+------------
 comment_id | integer | comment_id
btree, for table "public.django_comment_flags"

Index "public.django_comment_flags_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.django_comment_flags"

Index "public.django_comment_flags_flag_8b141fcb_like"
 Column |         Type          | Definition 
--------+-----------------------+------------
 flag   | character varying(30) | flag
btree, for table "public.django_comment_flags"

     Sequence "public.django_comment_flags_id_seq"
    Column     |  Type   |            Value            
---------------+---------+-----------------------------
 sequence_name | name    | django_comment_flags_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.django_comment_flags.id

Index "public.django_comment_flags_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_comment_flags"

Index "public.django_comment_flags_user_id_537f77a7_uniq"
   Column   |         Type          | Definition 
------------+-----------------------+------------
 user_id    | integer               | user_id
 comment_id | integer               | comment_id
 flag       | character varying(30) | flag
unique, btree, for table "public.django_comment_flags"

                                      Table "public.django_comments"
     Column      |           Type           |                          Modifiers                           
-----------------+--------------------------+--------------------------------------------------------------
 id              | integer                  | not null default nextval('django_comments_id_seq'::regclass)
 object_pk       | text                     | not null
 user_name       | character varying(50)    | not null
 user_email      | character varying(254)   | not null
 user_url        | character varying(200)   | not null
 comment         | text                     | not null
 submit_date     | timestamp with time zone | not null
 ip_address      | inet                     | 
 is_public       | boolean                  | not null
 is_removed      | boolean                  | not null
 content_type_id | integer                  | not null
 site_id         | integer                  | not null
 user_id         | integer                  | 
Indexes:
    "django_comments_pkey" PRIMARY KEY, btree (id)
    "django_comments_417f1b1c" btree (content_type_id)
    "django_comments_9365d6e7" btree (site_id)
    "django_comments_e8701ad4" btree (user_id)
    "django_comments_submit_date_514ed2d9_uniq" btree (submit_date)
Foreign-key constraints:
    "django_comme_content_type_id_c4afe962_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    "django_comments_site_id_9dcf666e_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    "django_comments_user_id_a0a440a1_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "django_comment_flags" CONSTRAINT "django_comment_flags_comment_id_d8054933_fk_django_comments_id" FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED

   Index "public.django_comments_417f1b1c"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 content_type_id | integer | content_type_id
btree, for table "public.django_comments"

Index "public.django_comments_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.django_comments"

Index "public.django_comments_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.django_comments"

     Sequence "public.django_comments_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | django_comments_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.django_comments.id

Index "public.django_comments_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_comments"

Index "public.django_comments_submit_date_514ed2d9_uniq"
   Column    |           Type           | Definition  
-------------+--------------------------+-------------
 submit_date | timestamp with time zone | submit_date
btree, for table "public.django_comments"

                                  Table "public.django_content_type"
  Column   |          Type          |                            Modifiers                             
-----------+------------------------+------------------------------------------------------------------
 id        | integer                | not null default nextval('django_content_type_id_seq'::regclass)
 app_label | character varying(100) | not null
 model     | character varying(100) | not null
Indexes:
    "django_content_type_pkey" PRIMARY KEY, btree (id)
    "django_content_type_app_label_76bd3d3b_uniq" UNIQUE CONSTRAINT, btree (app_label, model)
Referenced by:
    TABLE "auth_permission" CONSTRAINT "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_admin_log" CONSTRAINT "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_comments" CONSTRAINT "django_comme_content_type_id_c4afe962_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "taggit_taggeditem" CONSTRAINT "taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED

Index "public.django_content_type_app_label_76bd3d3b_uniq"
  Column   |          Type          | Definition 
-----------+------------------------+------------
 app_label | character varying(100) | app_label
 model     | character varying(100) | model
unique, btree, for table "public.django_content_type"

     Sequence "public.django_content_type_id_seq"
    Column     |  Type   |           Value            
---------------+---------+----------------------------
 sequence_name | name    | django_content_type_id_seq
 last_value    | bigint  | 30
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_content_type.id

Index "public.django_content_type_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_content_type"

                                        Table "public.django_flatpage"
        Column         |          Type          |                          Modifiers                           
-----------------------+------------------------+--------------------------------------------------------------
 id                    | integer                | not null default nextval('django_flatpage_id_seq'::regclass)
 url                   | character varying(100) | not null
 title                 | character varying(200) | not null
 content               | text                   | not null
 enable_comments       | boolean                | not null
 template_name         | character varying(70)  | not null
 registration_required | boolean                | not null
Indexes:
    "django_flatpage_pkey" PRIMARY KEY, btree (id)
    "django_flatpage_572d4e42" btree (url)
    "django_flatpage_url_41612362_like" btree (url varchar_pattern_ops)
Referenced by:
    TABLE "django_flatpage_sites" CONSTRAINT "django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id" FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED

   Index "public.django_flatpage_572d4e42"
 Column |          Type          | Definition 
--------+------------------------+------------
 url    | character varying(100) | url
btree, for table "public.django_flatpage"

     Sequence "public.django_flatpage_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | django_flatpage_id_seq
 last_value    | bigint  | 4
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_flatpage.id

Index "public.django_flatpage_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_flatpage"

                            Table "public.django_flatpage_sites"
   Column    |  Type   |                             Modifiers                              
-------------+---------+--------------------------------------------------------------------
 id          | integer | not null default nextval('django_flatpage_sites_id_seq'::regclass)
 flatpage_id | integer | not null
 site_id     | integer | not null
Indexes:
    "django_flatpage_sites_pkey" PRIMARY KEY, btree (id)
    "django_flatpage_sites_flatpage_id_0d29d9d1_uniq" UNIQUE CONSTRAINT, btree (flatpage_id, site_id)
    "django_flatpage_sites_9365d6e7" btree (site_id)
    "django_flatpage_sites_c3368d3a" btree (flatpage_id)
Foreign-key constraints:
    "django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id" FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED
    "django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED

Index "public.django_flatpage_sites_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.django_flatpage_sites"

Index "public.django_flatpage_sites_c3368d3a"
   Column    |  Type   | Definition  
-------------+---------+-------------
 flatpage_id | integer | flatpage_id
btree, for table "public.django_flatpage_sites"

Index "public.django_flatpage_sites_flatpage_id_0d29d9d1_uniq"
   Column    |  Type   | Definition  
-------------+---------+-------------
 flatpage_id | integer | flatpage_id
 site_id     | integer | site_id
unique, btree, for table "public.django_flatpage_sites"

     Sequence "public.django_flatpage_sites_id_seq"
    Column     |  Type   |            Value             
---------------+---------+------------------------------
 sequence_name | name    | django_flatpage_sites_id_seq
 last_value    | bigint  | 4
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_flatpage_sites.id

Index "public.django_flatpage_sites_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_flatpage_sites"

Index "public.django_flatpage_url_41612362_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 url    | character varying(100) | url
btree, for table "public.django_flatpage"

                                  Table "public.django_migrations"
 Column  |           Type           |                           Modifiers                            
---------+--------------------------+----------------------------------------------------------------
 id      | integer                  | not null default nextval('django_migrations_id_seq'::regclass)
 app     | character varying(255)   | not null
 name    | character varying(255)   | not null
 applied | timestamp with time zone | not null
Indexes:
    "django_migrations_pkey" PRIMARY KEY, btree (id)

     Sequence "public.django_migrations_id_seq"
    Column     |  Type   |          Value           
---------------+---------+--------------------------
 sequence_name | name    | django_migrations_id_seq
 last_value    | bigint  | 40
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_migrations.id

Index "public.django_migrations_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_migrations"

                                  Table "public.django_redirect"
  Column  |          Type          |                          Modifiers                           
----------+------------------------+--------------------------------------------------------------
 id       | integer                | not null default nextval('django_redirect_id_seq'::regclass)
 site_id  | integer                | not null
 old_path | character varying(200) | not null
 new_path | character varying(200) | not null
Indexes:
    "django_redirect_pkey" PRIMARY KEY, btree (id)
    "django_redirect_site_id_ac5dd16b_uniq" UNIQUE CONSTRAINT, btree (site_id, old_path)
    "django_redirect_91a0b591" btree (old_path)
    "django_redirect_9365d6e7" btree (site_id)
    "django_redirect_old_path_c6cc94d3_like" btree (old_path varchar_pattern_ops)
Foreign-key constraints:
    "django_redirect_site_id_c3e37341_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED

    Index "public.django_redirect_91a0b591"
  Column  |          Type          | Definition 
----------+------------------------+------------
 old_path | character varying(200) | old_path
btree, for table "public.django_redirect"

Index "public.django_redirect_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.django_redirect"

     Sequence "public.django_redirect_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | django_redirect_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.django_redirect.id

Index "public.django_redirect_old_path_c6cc94d3_like"
  Column  |          Type          | Definition 
----------+------------------------+------------
 old_path | character varying(200) | old_path
btree, for table "public.django_redirect"

Index "public.django_redirect_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_redirect"

Index "public.django_redirect_site_id_ac5dd16b_uniq"
  Column  |          Type          | Definition 
----------+------------------------+------------
 site_id  | integer                | site_id
 old_path | character varying(200) | old_path
unique, btree, for table "public.django_redirect"

            Table "public.django_session"
    Column    |           Type           | Modifiers 
--------------+--------------------------+-----------
 session_key  | character varying(40)    | not null
 session_data | text                     | not null
 expire_date  | timestamp with time zone | not null
Indexes:
    "django_session_pkey" PRIMARY KEY, btree (session_key)
    "django_session_de54fa62" btree (expire_date)
    "django_session_session_key_c0390e0f_like" btree (session_key varchar_pattern_ops)

        Index "public.django_session_de54fa62"
   Column    |           Type           | Definition  
-------------+--------------------------+-------------
 expire_date | timestamp with time zone | expire_date
btree, for table "public.django_session"

        Index "public.django_session_pkey"
   Column    |         Type          | Definition  
-------------+-----------------------+-------------
 session_key | character varying(40) | session_key
primary key, btree, for table "public.django_session"

Index "public.django_session_session_key_c0390e0f_like"
   Column    |         Type          | Definition  
-------------+-----------------------+-------------
 session_key | character varying(40) | session_key
btree, for table "public.django_session"

                                 Table "public.django_site"
 Column |          Type          |                        Modifiers                         
--------+------------------------+----------------------------------------------------------
 id     | integer                | not null default nextval('django_site_id_seq'::regclass)
 domain | character varying(100) | not null
 name   | character varying(50)  | not null
Indexes:
    "django_site_pkey" PRIMARY KEY, btree (id)
    "django_site_domain_a2e37b91_uniq" UNIQUE CONSTRAINT, btree (domain)
    "django_site_domain_a2e37b91_like" btree (domain varchar_pattern_ops)
Referenced by:
    TABLE "django_comments" CONSTRAINT "django_comments_site_id_9dcf666e_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_flatpage_sites" CONSTRAINT "django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "django_redirect" CONSTRAINT "django_redirect_site_id_c3e37341_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foirequest" CONSTRAINT "foirequest_foirequest_site_id_dcb5c9b1_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "frontpage_featuredrequest" CONSTRAINT "frontpage_featuredrequest_site_id_14db46b8_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_foilaw" CONSTRAINT "publicbody_foilaw_site_id_d10089d9_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbody_publicbody_site_id_90d3db19_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED

Index "public.django_site_domain_a2e37b91_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 domain | character varying(100) | domain
btree, for table "public.django_site"

Index "public.django_site_domain_a2e37b91_uniq"
 Column |          Type          | Definition 
--------+------------------------+------------
 domain | character varying(100) | domain
unique, btree, for table "public.django_site"

     Sequence "public.django_site_id_seq"
    Column     |  Type   |        Value        
---------------+---------+---------------------
 sequence_name | name    | django_site_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.django_site.id

Index "public.django_site_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.django_site"

                                    Table "public.foirequest_deferredmessage"
   Column   |           Type           |                                Modifiers                                
------------+--------------------------+-------------------------------------------------------------------------
 id         | integer                  | not null default nextval('foirequest_deferredmessage_id_seq'::regclass)
 recipient  | character varying(255)   | not null
 timestamp  | timestamp with time zone | not null
 mail       | text                     | not null
 spam       | boolean                  | not null
 request_id | integer                  | 
Indexes:
    "foirequest_deferredmessage_pkey" PRIMARY KEY, btree (id)
    "foirequest_deferredmessage_f68d2c36" btree (request_id)
Foreign-key constraints:
    "foirequest_defe_request_id_ed0d20f8_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_deferredmessage_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.foirequest_deferredmessage"

     Sequence "public.foirequest_deferredmessage_id_seq"
    Column     |  Type   |               Value               
---------------+---------+-----------------------------------
 sequence_name | name    | foirequest_deferredmessage_id_seq
 last_value    | bigint  | 221
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequest_deferredmessage.id

Index "public.foirequest_deferredmessage_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_deferredmessage"

                                    Table "public.foirequest_foiattachment"
    Column     |          Type          |                               Modifiers                               
---------------+------------------------+-----------------------------------------------------------------------
 id            | integer                | not null default nextval('foirequest_foiattachment_id_seq'::regclass)
 name          | character varying(255) | not null
 file          | character varying(255) | not null
 size          | integer                | 
 filetype      | character varying(100) | not null
 format        | character varying(100) | not null
 can_approve   | boolean                | not null
 approved      | boolean                | not null
 is_redacted   | boolean                | not null
 is_converted  | boolean                | not null
 belongs_to_id | integer                | 
 converted_id  | integer                | 
 redacted_id   | integer                | 
Indexes:
    "foirequest_foiattachment_pkey" PRIMARY KEY, btree (id)
    "foirequest_foiattachment_58ec0e5b" btree (converted_id)
    "foirequest_foiattachment_7de27a13" btree (belongs_to_id)
    "foirequest_foiattachment_f94a1402" btree (redacted_id)
Foreign-key constraints:
    "foirequest__redacted_id_620e6b78_fk_foirequest_foiattachment_id" FOREIGN KEY (redacted_id) REFERENCES foirequest_foiattachment(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_converted_id_028de0c5_fk_foirequest_foiattachment_id" FOREIGN KEY (converted_id) REFERENCES foirequest_foiattachment(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_f_belongs_to_id_4aa1ff91_fk_foirequest_foimessage_id" FOREIGN KEY (belongs_to_id) REFERENCES foirequest_foimessage(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "foirequest_foiattachment" CONSTRAINT "foirequest__redacted_id_620e6b78_fk_foirequest_foiattachment_id" FOREIGN KEY (redacted_id) REFERENCES foirequest_foiattachment(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foiattachment" CONSTRAINT "foirequest_converted_id_028de0c5_fk_foirequest_foiattachment_id" FOREIGN KEY (converted_id) REFERENCES foirequest_foiattachment(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_foiattachment_58ec0e5b"
    Column    |  Type   |  Definition  
--------------+---------+--------------
 converted_id | integer | converted_id
btree, for table "public.foirequest_foiattachment"

Index "public.foirequest_foiattachment_7de27a13"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 belongs_to_id | integer | belongs_to_id
btree, for table "public.foirequest_foiattachment"

Index "public.foirequest_foiattachment_f94a1402"
   Column    |  Type   | Definition  
-------------+---------+-------------
 redacted_id | integer | redacted_id
btree, for table "public.foirequest_foiattachment"

     Sequence "public.foirequest_foiattachment_id_seq"
    Column     |  Type   |              Value              
---------------+---------+---------------------------------
 sequence_name | name    | foirequest_foiattachment_id_seq
 last_value    | bigint  | 5903
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequest_foiattachment.id

Index "public.foirequest_foiattachment_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_foiattachment"

                                      Table "public.foirequest_foievent"
     Column     |           Type           |                            Modifiers                             
----------------+--------------------------+------------------------------------------------------------------
 id             | integer                  | not null default nextval('foirequest_foievent_id_seq'::regclass)
 public         | boolean                  | not null
 event_name     | character varying(255)   | not null
 timestamp      | timestamp with time zone | not null
 context_json   | text                     | not null
 public_body_id | integer                  | 
 request_id     | integer                  | not null
 user_id        | integer                  | 
Indexes:
    "foirequest_foievent_pkey" PRIMARY KEY, btree (id)
    "foirequest_foievent_4af90b76" btree (public_body_id)
    "foirequest_foievent_e8701ad4" btree (user_id)
    "foirequest_foievent_f68d2c36" btree (request_id)
Foreign-key constraints:
    "foirequest__public_body_id_8e1a12b5_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foie_request_id_732878fb_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foievent_user_id_cdabb4cd_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_foievent_4af90b76"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 public_body_id | integer | public_body_id
btree, for table "public.foirequest_foievent"

Index "public.foirequest_foievent_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.foirequest_foievent"

Index "public.foirequest_foievent_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.foirequest_foievent"

     Sequence "public.foirequest_foievent_id_seq"
    Column     |  Type   |           Value            
---------------+---------+----------------------------
 sequence_name | name    | foirequest_foievent_id_seq
 last_value    | bigint  | 9725
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequest_foievent.id

Index "public.foirequest_foievent_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_foievent"

                                           Table "public.foirequest_foimessage"
          Column          |           Type           |                             Modifiers                              
--------------------------+--------------------------+--------------------------------------------------------------------
 id                       | integer                  | not null default nextval('foirequest_foimessage_id_seq'::regclass)
 sent                     | boolean                  | not null
 is_response              | boolean                  | not null
 is_postal                | boolean                  | not null
 is_escalation            | boolean                  | not null
 content_hidden           | boolean                  | not null
 sender_email             | character varying(255)   | not null
 sender_name              | character varying(255)   | not null
 recipient                | character varying(255)   | 
 recipient_email          | character varying(255)   | 
 status                   | character varying(50)    | 
 timestamp                | timestamp with time zone | not null
 subject                  | character varying(255)   | not null
 subject_redacted         | character varying(255)   | not null
 plaintext                | text                     | 
 plaintext_redacted       | text                     | 
 html                     | text                     | 
 original                 | text                     | not null
 redacted                 | boolean                  | not null
 not_publishable          | boolean                  | not null
 recipient_public_body_id | integer                  | 
 request_id               | integer                  | not null
 sender_public_body_id    | integer                  | 
 sender_user_id           | integer                  | 
Indexes:
    "foirequest_foimessage_pkey" PRIMARY KEY, btree (id)
    "foirequest_foimessage_83f2d795" btree (recipient_public_body_id)
    "foirequest_foimessage_dd1013fb" btree (sender_user_id)
    "foirequest_foimessage_f1df7911" btree (sender_public_body_id)
    "foirequest_foimessage_f68d2c36" btree (request_id)
Foreign-key constraints:
    "f_recipient_public_body_id_8c898210_fk_publicbody_publicbody_id" FOREIGN KEY (recipient_public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "foir_sender_public_body_id_72b5aa4f_fk_publicbody_publicbody_id" FOREIGN KEY (sender_public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foim_request_id_70de85b6_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foimessag_sender_user_id_1d8a451e_fk_account_user_id" FOREIGN KEY (sender_user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "foirequest_foiattachment" CONSTRAINT "foirequest_f_belongs_to_id_4aa1ff91_fk_foirequest_foimessage_id" FOREIGN KEY (belongs_to_id) REFERENCES foirequest_foimessage(id) DEFERRABLE INITIALLY DEFERRED

         Index "public.foirequest_foimessage_83f2d795"
          Column          |  Type   |        Definition        
--------------------------+---------+--------------------------
 recipient_public_body_id | integer | recipient_public_body_id
btree, for table "public.foirequest_foimessage"

Index "public.foirequest_foimessage_dd1013fb"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 sender_user_id | integer | sender_user_id
btree, for table "public.foirequest_foimessage"

      Index "public.foirequest_foimessage_f1df7911"
        Column         |  Type   |      Definition       
-----------------------+---------+-----------------------
 sender_public_body_id | integer | sender_public_body_id
btree, for table "public.foirequest_foimessage"

Index "public.foirequest_foimessage_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.foirequest_foimessage"

     Sequence "public.foirequest_foimessage_id_seq"
    Column     |  Type   |            Value             
---------------+---------+------------------------------
 sequence_name | name    | foirequest_foimessage_id_seq
 last_value    | bigint  | 6421
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequest_foimessage.id

Index "public.foirequest_foimessage_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_foimessage"

                                      Table "public.foirequest_foirequest"
     Column      |           Type           |                             Modifiers                              
-----------------+--------------------------+--------------------------------------------------------------------
 id              | integer                  | not null default nextval('foirequest_foirequest_id_seq'::regclass)
 title           | character varying(255)   | not null
 slug            | character varying(255)   | not null
 description     | text                     | not null
 summary         | text                     | not null
 status          | character varying(50)    | not null
 resolution      | character varying(50)    | not null
 public          | boolean                  | not null
 visibility      | smallint                 | not null
 first_message   | timestamp with time zone | 
 last_message    | timestamp with time zone | 
 resolved_on     | timestamp with time zone | 
 due_date        | timestamp with time zone | 
 secret_address  | character varying(255)   | not null
 secret          | character varying(100)   | not null
 same_as_count   | integer                  | not null
 costs           | double precision         | not null
 refusal_reason  | character varying(1024)  | not null
 checked         | boolean                  | not null
 is_foi          | boolean                  | not null
 jurisdiction_id | integer                  | 
 law_id          | integer                  | 
 public_body_id  | integer                  | 
 same_as_id      | integer                  | 
 site_id         | integer                  | 
 user_id         | integer                  | 
 reference       | character varying(255)   | not null
 is_blocked      | boolean                  | not null
Indexes:
    "foirequest_foirequest_pkey" PRIMARY KEY, btree (id)
    "foirequest_foirequest_secret_address_key" UNIQUE CONSTRAINT, btree (secret_address)
    "foirequest_foirequest_slug_key" UNIQUE CONSTRAINT, btree (slug)
    "foirequest_foirequest_4af90b76" btree (public_body_id)
    "foirequest_foirequest_6302331e" btree (law_id)
    "foirequest_foirequest_9365d6e7" btree (site_id)
    "foirequest_foirequest_d0e59fcd" btree (same_as_id)
    "foirequest_foirequest_e8701ad4" btree (user_id)
    "foirequest_foirequest_f364b99a" btree (jurisdiction_id)
    "foirequest_foirequest_secret_address_6acba6b4_like" btree (secret_address varchar_pattern_ops)
    "foirequest_foirequest_slug_73ec7407_like" btree (slug varchar_pattern_ops)
Foreign-key constraints:
    "foireque_jurisdiction_id_ae73f959_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest__public_body_id_a0e454c3_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foir_same_as_id_f3e4c3c4_fk_foirequest_foirequest_id" FOREIGN KEY (same_as_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foirequest_law_id_847444f3_fk_publicbody_foilaw_id" FOREIGN KEY (law_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foirequest_site_id_dcb5c9b1_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_foirequest_user_id_45ac55e3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "foirequest_taggedfoirequest" CONSTRAINT "foireque_content_object_id_da801f5a_fk_foirequest_foirequest_id" FOREIGN KEY (content_object_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_deferredmessage" CONSTRAINT "foirequest_defe_request_id_ed0d20f8_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foievent" CONSTRAINT "foirequest_foie_request_id_732878fb_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foimessage" CONSTRAINT "foirequest_foim_request_id_70de85b6_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foirequest" CONSTRAINT "foirequest_foir_same_as_id_f3e4c3c4_fk_foirequest_foirequest_id" FOREIGN KEY (same_as_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_publicbodysuggestion" CONSTRAINT "foirequest_publ_request_id_d35744e0_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequestfollower_foirequestfollower" CONSTRAINT "foirequestfollo_request_id_77311d74_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "frontpage_featuredrequest" CONSTRAINT "frontpage_featu_request_id_a3c5f00a_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_foirequest_4af90b76"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 public_body_id | integer | public_body_id
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_6302331e"
 Column |  Type   | Definition 
--------+---------+------------
 law_id | integer | law_id
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_d0e59fcd"
   Column   |  Type   | Definition 
------------+---------+------------
 same_as_id | integer | same_as_id
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_f364b99a"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 jurisdiction_id | integer | jurisdiction_id
btree, for table "public.foirequest_foirequest"

     Sequence "public.foirequest_foirequest_id_seq"
    Column     |  Type   |            Value             
---------------+---------+------------------------------
 sequence_name | name    | foirequest_foirequest_id_seq
 last_value    | bigint  | 1814
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 31
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequest_foirequest.id

Index "public.foirequest_foirequest_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_secret_address_6acba6b4_like"
     Column     |          Type          |   Definition   
----------------+------------------------+----------------
 secret_address | character varying(255) | secret_address
btree, for table "public.foirequest_foirequest"

 Index "public.foirequest_foirequest_secret_address_key"
     Column     |          Type          |   Definition   
----------------+------------------------+----------------
 secret_address | character varying(255) | secret_address
unique, btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_slug_73ec7407_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.foirequest_foirequest"

Index "public.foirequest_foirequest_slug_key"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
unique, btree, for table "public.foirequest_foirequest"

                                      Table "public.foirequest_publicbodysuggestion"
     Column     |           Type           |                                  Modifiers                                   
----------------+--------------------------+------------------------------------------------------------------------------
 id             | integer                  | not null default nextval('foirequest_publicbodysuggestion_id_seq'::regclass)
 timestamp      | timestamp with time zone | not null
 reason         | text                     | not null
 public_body_id | integer                  | not null
 request_id     | integer                  | not null
 user_id        | integer                  | 
Indexes:
    "foirequest_publicbodysuggestion_pkey" PRIMARY KEY, btree (id)
    "foirequest_publicbodysuggestion_4af90b76" btree (public_body_id)
    "foirequest_publicbodysuggestion_e8701ad4" btree (user_id)
    "foirequest_publicbodysuggestion_f68d2c36" btree (request_id)
Foreign-key constraints:
    "foirequest__public_body_id_f2b88987_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_publ_request_id_d35744e0_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_publicbodysugges_user_id_64bf5114_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_publicbodysuggestion_4af90b76"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 public_body_id | integer | public_body_id
btree, for table "public.foirequest_publicbodysuggestion"

Index "public.foirequest_publicbodysuggestion_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.foirequest_publicbodysuggestion"

Index "public.foirequest_publicbodysuggestion_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.foirequest_publicbodysuggestion"

     Sequence "public.foirequest_publicbodysuggestion_id_seq"
    Column     |  Type   |                 Value                  
---------------+---------+----------------------------------------
 sequence_name | name    | foirequest_publicbodysuggestion_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.foirequest_publicbodysuggestion.id

Index "public.foirequest_publicbodysuggestion_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_publicbodysuggestion"

                               Table "public.foirequest_taggedfoirequest"
      Column       |  Type   |                                Modifiers                                 
-------------------+---------+--------------------------------------------------------------------------
 id                | integer | not null default nextval('foirequest_taggedfoirequest_id_seq'::regclass)
 content_object_id | integer | not null
 tag_id            | integer | not null
Indexes:
    "foirequest_taggedfoirequest_pkey" PRIMARY KEY, btree (id)
    "foirequest_taggedfoirequest_09a80f33" btree (content_object_id)
    "foirequest_taggedfoirequest_76f094bc" btree (tag_id)
Foreign-key constraints:
    "foireque_content_object_id_da801f5a_fk_foirequest_foirequest_id" FOREIGN KEY (content_object_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequest_taggedfoirequest_tag_id_e80feea1_fk_taggit_tag_id" FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequest_taggedfoirequest_09a80f33"
      Column       |  Type   |    Definition     
-------------------+---------+-------------------
 content_object_id | integer | content_object_id
btree, for table "public.foirequest_taggedfoirequest"

Index "public.foirequest_taggedfoirequest_76f094bc"
 Column |  Type   | Definition 
--------+---------+------------
 tag_id | integer | tag_id
btree, for table "public.foirequest_taggedfoirequest"

     Sequence "public.foirequest_taggedfoirequest_id_seq"
    Column     |  Type   |               Value                
---------------+---------+------------------------------------
 sequence_name | name    | foirequest_taggedfoirequest_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.foirequest_taggedfoirequest.id

Index "public.foirequest_taggedfoirequest_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequest_taggedfoirequest"

                                    Table "public.foirequestfollower_foirequestfollower"
   Column   |           Type           |                                     Modifiers                                      
------------+--------------------------+------------------------------------------------------------------------------------
 id         | integer                  | not null default nextval('foirequestfollower_foirequestfollower_id_seq'::regclass)
 email      | character varying(255)   | not null
 confirmed  | boolean                  | not null
 timestamp  | timestamp with time zone | not null
 request_id | integer                  | not null
 user_id    | integer                  | 
Indexes:
    "foirequestfollower_foirequestfollower_pkey" PRIMARY KEY, btree (id)
    "foirequestfollower_foirequestfollower_e8701ad4" btree (user_id)
    "foirequestfollower_foirequestfollower_f68d2c36" btree (request_id)
Foreign-key constraints:
    "foirequestfollo_request_id_77311d74_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "foirequestfollower_foireque_user_id_d7804ee3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.foirequestfollower_foirequestfollower_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.foirequestfollower_foirequestfollower"

Index "public.foirequestfollower_foirequestfollower_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.foirequestfollower_foirequestfollower"

     Sequence "public.foirequestfollower_foirequestfollower_id_seq"
    Column     |  Type   |                    Value                     
---------------+---------+----------------------------------------------
 sequence_name | name    | foirequestfollower_foirequestfollower_id_seq
 last_value    | bigint  | 14
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.foirequestfollower_foirequestfollower.id

Index "public.foirequestfollower_foirequestfollower_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foirequestfollower_foirequestfollower"

                                    Table "public.foisite_foisite"
    Column    |          Type          |                          Modifiers                           
--------------+------------------------+--------------------------------------------------------------
 id           | integer                | not null default nextval('foisite_foisite_id_seq'::regclass)
 country_code | character varying(5)   | not null
 country_name | character varying(255) | not null
 name         | character varying(255) | not null
 url          | character varying(255) | not null
 text         | text                   | not null
 enabled      | boolean                | not null
Indexes:
    "foisite_foisite_pkey" PRIMARY KEY, btree (id)

     Sequence "public.foisite_foisite_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | foisite_foisite_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.foisite_foisite.id

Index "public.foisite_foisite_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.foisite_foisite"

                                    Table "public.frontpage_featuredrequest"
   Column   |           Type           |                               Modifiers                                
------------+--------------------------+------------------------------------------------------------------------
 id         | integer                  | not null default nextval('frontpage_featuredrequest_id_seq'::regclass)
 timestamp  | timestamp with time zone | not null
 title      | character varying(255)   | not null
 text       | text                     | not null
 url        | character varying(255)   | not null
 request_id | integer                  | 
 site_id    | integer                  | 
 user_id    | integer                  | 
Indexes:
    "frontpage_featuredrequest_pkey" PRIMARY KEY, btree (id)
    "frontpage_featuredrequest_9365d6e7" btree (site_id)
    "frontpage_featuredrequest_e8701ad4" btree (user_id)
    "frontpage_featuredrequest_f68d2c36" btree (request_id)
Foreign-key constraints:
    "frontpage_featu_request_id_a3c5f00a_fk_foirequest_foirequest_id" FOREIGN KEY (request_id) REFERENCES foirequest_foirequest(id) DEFERRABLE INITIALLY DEFERRED
    "frontpage_featuredrequest_site_id_14db46b8_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
    "frontpage_featuredrequest_user_id_3c4678a3_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

Index "public.frontpage_featuredrequest_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.frontpage_featuredrequest"

Index "public.frontpage_featuredrequest_e8701ad4"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
btree, for table "public.frontpage_featuredrequest"

Index "public.frontpage_featuredrequest_f68d2c36"
   Column   |  Type   | Definition 
------------+---------+------------
 request_id | integer | request_id
btree, for table "public.frontpage_featuredrequest"

     Sequence "public.frontpage_featuredrequest_id_seq"
    Column     |  Type   |              Value               
---------------+---------+----------------------------------
 sequence_name | name    | frontpage_featuredrequest_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.frontpage_featuredrequest.id

Index "public.frontpage_featuredrequest_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.frontpage_featuredrequest"

                                         Table "public.publicbody_foilaw"
         Column         |          Type          |                           Modifiers                            
------------------------+------------------------+----------------------------------------------------------------
 id                     | integer                | not null default nextval('publicbody_foilaw_id_seq'::regclass)
 name                   | character varying(255) | not null
 slug                   | character varying(255) | not null
 description            | text                   | not null
 long_description       | text                   | not null
 created                | date                   | 
 updated                | date                   | 
 request_note           | text                   | not null
 meta                   | boolean                | not null
 letter_start           | text                   | not null
 letter_end             | text                   | not null
 priority               | smallint               | not null
 url                    | character varying(255) | not null
 max_response_time      | integer                | 
 max_response_time_unit | character varying(32)  | not null
 refusal_reasons        | text                   | not null
 email_only             | boolean                | not null
 jurisdiction_id        | integer                | 
 mediator_id            | integer                | 
 site_id                | integer                | 
Indexes:
    "publicbody_foilaw_pkey" PRIMARY KEY, btree (id)
    "publicbody_foilaw_2dbcba41" btree (slug)
    "publicbody_foilaw_9365d6e7" btree (site_id)
    "publicbody_foilaw_cfc7513e" btree (mediator_id)
    "publicbody_foilaw_f364b99a" btree (jurisdiction_id)
    "publicbody_foilaw_slug_5aa6f9fb_like" btree (slug varchar_pattern_ops)
Foreign-key constraints:
    "publicbo_jurisdiction_id_3c8a705a_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_foi_mediator_id_000f762a_fk_publicbody_publicbody_id" FOREIGN KEY (mediator_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_foilaw_site_id_d10089d9_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "foirequest_foirequest" CONSTRAINT "foirequest_foirequest_law_id_847444f3_fk_publicbody_foilaw_id" FOREIGN KEY (law_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_foilaw_combined" CONSTRAINT "publicbody_foil_from_foilaw_id_5658707b_fk_publicbody_foilaw_id" FOREIGN KEY (from_foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_foilaw_combined" CONSTRAINT "publicbody_foilaw_to_foilaw_id_50822374_fk_publicbody_foilaw_id" FOREIGN KEY (to_foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody_laws" CONSTRAINT "publicbody_publicbod_foilaw_id_cefb1126_fk_publicbody_foilaw_id" FOREIGN KEY (foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED

  Index "public.publicbody_foilaw_2dbcba41"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_foilaw"

Index "public.publicbody_foilaw_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.publicbody_foilaw"

Index "public.publicbody_foilaw_cfc7513e"
   Column    |  Type   | Definition  
-------------+---------+-------------
 mediator_id | integer | mediator_id
btree, for table "public.publicbody_foilaw"

                             Table "public.publicbody_foilaw_combined"
     Column     |  Type   |                                Modifiers                                
----------------+---------+-------------------------------------------------------------------------
 id             | integer | not null default nextval('publicbody_foilaw_combined_id_seq'::regclass)
 from_foilaw_id | integer | not null
 to_foilaw_id   | integer | not null
Indexes:
    "publicbody_foilaw_combined_pkey" PRIMARY KEY, btree (id)
    "publicbody_foilaw_combined_from_foilaw_id_e4e3c632_uniq" UNIQUE CONSTRAINT, btree (from_foilaw_id, to_foilaw_id)
    "publicbody_foilaw_combined_2559bc73" btree (to_foilaw_id)
    "publicbody_foilaw_combined_7f35af0d" btree (from_foilaw_id)
Foreign-key constraints:
    "publicbody_foil_from_foilaw_id_5658707b_fk_publicbody_foilaw_id" FOREIGN KEY (from_foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_foilaw_to_foilaw_id_50822374_fk_publicbody_foilaw_id" FOREIGN KEY (to_foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED

Index "public.publicbody_foilaw_combined_2559bc73"
    Column    |  Type   |  Definition  
--------------+---------+--------------
 to_foilaw_id | integer | to_foilaw_id
btree, for table "public.publicbody_foilaw_combined"

Index "public.publicbody_foilaw_combined_7f35af0d"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 from_foilaw_id | integer | from_foilaw_id
btree, for table "public.publicbody_foilaw_combined"

Index "public.publicbody_foilaw_combined_from_foilaw_id_e4e3c632_uniq"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 from_foilaw_id | integer | from_foilaw_id
 to_foilaw_id   | integer | to_foilaw_id
unique, btree, for table "public.publicbody_foilaw_combined"

     Sequence "public.publicbody_foilaw_combined_id_seq"
    Column     |  Type   |               Value               
---------------+---------+-----------------------------------
 sequence_name | name    | publicbody_foilaw_combined_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.publicbody_foilaw_combined.id

Index "public.publicbody_foilaw_combined_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_foilaw_combined"

  Index "public.publicbody_foilaw_f364b99a"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 jurisdiction_id | integer | jurisdiction_id
btree, for table "public.publicbody_foilaw"

     Sequence "public.publicbody_foilaw_id_seq"
    Column     |  Type   |          Value           
---------------+---------+--------------------------
 sequence_name | name    | publicbody_foilaw_id_seq
 last_value    | bigint  | 5
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_foilaw.id

Index "public.publicbody_foilaw_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_foilaw"

Index "public.publicbody_foilaw_slug_5aa6f9fb_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_foilaw"

                                   Table "public.publicbody_jurisdiction"
   Column    |          Type          |                              Modifiers                               
-------------+------------------------+----------------------------------------------------------------------
 id          | integer                | not null default nextval('publicbody_jurisdiction_id_seq'::regclass)
 name        | character varying(255) | not null
 slug        | character varying(255) | not null
 description | text                   | not null
 hidden      | boolean                | not null
 rank        | smallint               | not null
Indexes:
    "publicbody_jurisdiction_pkey" PRIMARY KEY, btree (id)
    "publicbody_jurisdiction_2dbcba41" btree (slug)
    "publicbody_jurisdiction_slug_a76a3869_like" btree (slug varchar_pattern_ops)
Referenced by:
    TABLE "foirequest_foirequest" CONSTRAINT "foireque_jurisdiction_id_ae73f959_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_foilaw" CONSTRAINT "publicbo_jurisdiction_id_3c8a705a_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbo_jurisdiction_id_a8d3c6e7_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED

Index "public.publicbody_jurisdiction_2dbcba41"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_jurisdiction"

     Sequence "public.publicbody_jurisdiction_id_seq"
    Column     |  Type   |             Value              
---------------+---------+--------------------------------
 sequence_name | name    | publicbody_jurisdiction_id_seq
 last_value    | bigint  | 5
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_jurisdiction.id

Index "public.publicbody_jurisdiction_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_jurisdiction"

Index "public.publicbody_jurisdiction_slug_a76a3869_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_jurisdiction"

                                        Table "public.publicbody_publicbody"
       Column        |           Type           |                             Modifiers                              
---------------------+--------------------------+--------------------------------------------------------------------
 id                  | integer                  | not null default nextval('publicbody_publicbody_id_seq'::regclass)
 name                | character varying(255)   | not null
 other_names         | text                     | not null
 slug                | character varying(255)   | not null
 description         | text                     | not null
 url                 | character varying(500)   | 
 depth               | smallint                 | not null
 classification      | character varying(255)   | not null
 classification_slug | character varying(255)   | not null
 email               | character varying(254)   | 
 contact             | text                     | not null
 address             | text                     | not null
 website_dump        | text                     | 
 request_note        | text                     | not null
 created_at          | timestamp with time zone | not null
 updated_at          | timestamp with time zone | not null
 confirmed           | boolean                  | not null
 number_of_requests  | integer                  | not null
 _created_by_id      | integer                  | 
 _updated_by_id      | integer                  | 
 jurisdiction_id     | integer                  | 
 parent_id           | integer                  | 
 root_id             | integer                  | 
 site_id             | integer                  | 
 file_index          | character varying(1024)  | not null
 org_chart           | character varying(1024)  | not null
Indexes:
    "publicbody_publicbody_pkey" PRIMARY KEY, btree (id)
    "publicbody_publicbody_0cbf2fa0" btree (classification_slug)
    "publicbody_publicbody_2dbcba41" btree (slug)
    "publicbody_publicbody_3961d605" btree (_created_by_id)
    "publicbody_publicbody_493b3ba4" btree (root_id)
    "publicbody_publicbody_6be37982" btree (parent_id)
    "publicbody_publicbody_9365d6e7" btree (site_id)
    "publicbody_publicbody_a0ea811d" btree (_updated_by_id)
    "publicbody_publicbody_classification_slug_7a10b386_like" btree (classification_slug varchar_pattern_ops)
    "publicbody_publicbody_f364b99a" btree (jurisdiction_id)
    "publicbody_publicbody_slug_5f169099_like" btree (slug varchar_pattern_ops)
Foreign-key constraints:
    "publicbo_jurisdiction_id_a8d3c6e7_fk_publicbody_jurisdiction_id" FOREIGN KEY (jurisdiction_id) REFERENCES publicbody_jurisdiction(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publi_parent_id_fc748211_fk_publicbody_publicbody_id" FOREIGN KEY (parent_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publicb_root_id_4cc4a128_fk_publicbody_publicbody_id" FOREIGN KEY (root_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publicbod__created_by_id_318937ec_fk_account_user_id" FOREIGN KEY (_created_by_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publicbod__updated_by_id_255f09ac_fk_account_user_id" FOREIGN KEY (_updated_by_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publicbody_site_id_90d3db19_fk_django_site_id" FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED
Referenced by:
    TABLE "foirequest_foimessage" CONSTRAINT "f_recipient_public_body_id_8c898210_fk_publicbody_publicbody_id" FOREIGN KEY (recipient_public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foimessage" CONSTRAINT "foir_sender_public_body_id_72b5aa4f_fk_publicbody_publicbody_id" FOREIGN KEY (sender_public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foievent" CONSTRAINT "foirequest__public_body_id_8e1a12b5_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_foirequest" CONSTRAINT "foirequest__public_body_id_a0e454c3_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "foirequest_publicbodysuggestion" CONSTRAINT "foirequest__public_body_id_f2b88987_fk_publicbody_publicbody_id" FOREIGN KEY (public_body_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_taggedpublicbody" CONSTRAINT "publicbo_content_object_id_0b753d03_fk_publicbody_publicbody_id" FOREIGN KEY (content_object_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_foilaw" CONSTRAINT "publicbody_foi_mediator_id_000f762a_fk_publicbody_publicbody_id" FOREIGN KEY (mediator_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody_laws" CONSTRAINT "publicbody_p_publicbody_id_4e365255_fk_publicbody_publicbody_id" FOREIGN KEY (publicbody_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbody_publi_parent_id_fc748211_fk_publicbody_publicbody_id" FOREIGN KEY (parent_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "publicbody_publicbody" CONSTRAINT "publicbody_publicb_root_id_4cc4a128_fk_publicbody_publicbody_id" FOREIGN KEY (root_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED

           Index "public.publicbody_publicbody_0cbf2fa0"
       Column        |          Type          |     Definition      
---------------------+------------------------+---------------------
 classification_slug | character varying(255) | classification_slug
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_2dbcba41"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_3961d605"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 _created_by_id | integer | _created_by_id
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_493b3ba4"
 Column  |  Type   | Definition 
---------+---------+------------
 root_id | integer | root_id
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_6be37982"
  Column   |  Type   | Definition 
-----------+---------+------------
 parent_id | integer | parent_id
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_9365d6e7"
 Column  |  Type   | Definition 
---------+---------+------------
 site_id | integer | site_id
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_a0ea811d"
     Column     |  Type   |   Definition   
----------------+---------+----------------
 _updated_by_id | integer | _updated_by_id
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_classification_slug_7a10b386_like"
       Column        |          Type          |     Definition      
---------------------+------------------------+---------------------
 classification_slug | character varying(255) | classification_slug
btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_f364b99a"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 jurisdiction_id | integer | jurisdiction_id
btree, for table "public.publicbody_publicbody"

     Sequence "public.publicbody_publicbody_id_seq"
    Column     |  Type   |            Value             
---------------+---------+------------------------------
 sequence_name | name    | publicbody_publicbody_id_seq
 last_value    | bigint  | 202
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_publicbody.id

                             Table "public.publicbody_publicbody_laws"
    Column     |  Type   |                                Modifiers                                
---------------+---------+-------------------------------------------------------------------------
 id            | integer | not null default nextval('publicbody_publicbody_laws_id_seq'::regclass)
 publicbody_id | integer | not null
 foilaw_id     | integer | not null
Indexes:
    "publicbody_publicbody_laws_pkey" PRIMARY KEY, btree (id)
    "publicbody_publicbody_laws_publicbody_id_80158d12_uniq" UNIQUE CONSTRAINT, btree (publicbody_id, foilaw_id)
    "publicbody_publicbody_laws_2e7dab5e" btree (publicbody_id)
    "publicbody_publicbody_laws_79bc7524" btree (foilaw_id)
Foreign-key constraints:
    "publicbody_p_publicbody_id_4e365255_fk_publicbody_publicbody_id" FOREIGN KEY (publicbody_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_publicbod_foilaw_id_cefb1126_fk_publicbody_foilaw_id" FOREIGN KEY (foilaw_id) REFERENCES publicbody_foilaw(id) DEFERRABLE INITIALLY DEFERRED

Index "public.publicbody_publicbody_laws_2e7dab5e"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 publicbody_id | integer | publicbody_id
btree, for table "public.publicbody_publicbody_laws"

Index "public.publicbody_publicbody_laws_79bc7524"
  Column   |  Type   | Definition 
-----------+---------+------------
 foilaw_id | integer | foilaw_id
btree, for table "public.publicbody_publicbody_laws"

     Sequence "public.publicbody_publicbody_laws_id_seq"
    Column     |  Type   |               Value               
---------------+---------+-----------------------------------
 sequence_name | name    | publicbody_publicbody_laws_id_seq
 last_value    | bigint  | 202
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_publicbody_laws.id

Index "public.publicbody_publicbody_laws_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_publicbody_laws"

Index "public.publicbody_publicbody_laws_publicbody_id_80158d12_uniq"
    Column     |  Type   |  Definition   
---------------+---------+---------------
 publicbody_id | integer | publicbody_id
 foilaw_id     | integer | foilaw_id
unique, btree, for table "public.publicbody_publicbody_laws"

Index "public.publicbody_publicbody_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_publicbody"

Index "public.publicbody_publicbody_slug_5f169099_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(255) | slug
btree, for table "public.publicbody_publicbody"

                                  Table "public.publicbody_publicbodytag"
  Column  |          Type          |                               Modifiers                               
----------+------------------------+-----------------------------------------------------------------------
 id       | integer                | not null default nextval('publicbody_publicbodytag_id_seq'::regclass)
 name     | character varying(100) | not null
 slug     | character varying(100) | not null
 is_topic | boolean                | not null
 rank     | smallint               | not null
Indexes:
    "publicbody_publicbodytag_pkey" PRIMARY KEY, btree (id)
    "publicbody_publicbodytag_name_key" UNIQUE CONSTRAINT, btree (name)
    "publicbody_publicbodytag_slug_key" UNIQUE CONSTRAINT, btree (slug)
    "publicbody_publicbodytag_name_2270072a_like" btree (name varchar_pattern_ops)
    "publicbody_publicbodytag_slug_cb4b6a8e_like" btree (slug varchar_pattern_ops)
Referenced by:
    TABLE "publicbody_taggedpublicbody" CONSTRAINT "publicbody_tagge_tag_id_000bb4cb_fk_publicbody_publicbodytag_id" FOREIGN KEY (tag_id) REFERENCES publicbody_publicbodytag(id) DEFERRABLE INITIALLY DEFERRED

     Sequence "public.publicbody_publicbodytag_id_seq"
    Column     |  Type   |              Value              
---------------+---------+---------------------------------
 sequence_name | name    | publicbody_publicbodytag_id_seq
 last_value    | bigint  | 993
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 32
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_publicbodytag.id

Index "public.publicbody_publicbodytag_name_2270072a_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 name   | character varying(100) | name
btree, for table "public.publicbody_publicbodytag"

Index "public.publicbody_publicbodytag_name_key"
 Column |          Type          | Definition 
--------+------------------------+------------
 name   | character varying(100) | name
unique, btree, for table "public.publicbody_publicbodytag"

Index "public.publicbody_publicbodytag_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_publicbodytag"

Index "public.publicbody_publicbodytag_slug_cb4b6a8e_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(100) | slug
btree, for table "public.publicbody_publicbodytag"

Index "public.publicbody_publicbodytag_slug_key"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(100) | slug
unique, btree, for table "public.publicbody_publicbodytag"

                               Table "public.publicbody_taggedpublicbody"
      Column       |  Type   |                                Modifiers                                 
-------------------+---------+--------------------------------------------------------------------------
 id                | integer | not null default nextval('publicbody_taggedpublicbody_id_seq'::regclass)
 content_object_id | integer | not null
 tag_id            | integer | not null
Indexes:
    "publicbody_taggedpublicbody_pkey" PRIMARY KEY, btree (id)
    "publicbody_taggedpublicbody_09a80f33" btree (content_object_id)
    "publicbody_taggedpublicbody_76f094bc" btree (tag_id)
Foreign-key constraints:
    "publicbo_content_object_id_0b753d03_fk_publicbody_publicbody_id" FOREIGN KEY (content_object_id) REFERENCES publicbody_publicbody(id) DEFERRABLE INITIALLY DEFERRED
    "publicbody_tagge_tag_id_000bb4cb_fk_publicbody_publicbodytag_id" FOREIGN KEY (tag_id) REFERENCES publicbody_publicbodytag(id) DEFERRABLE INITIALLY DEFERRED

Index "public.publicbody_taggedpublicbody_09a80f33"
      Column       |  Type   |    Definition     
-------------------+---------+-------------------
 content_object_id | integer | content_object_id
btree, for table "public.publicbody_taggedpublicbody"

Index "public.publicbody_taggedpublicbody_76f094bc"
 Column |  Type   | Definition 
--------+---------+------------
 tag_id | integer | tag_id
btree, for table "public.publicbody_taggedpublicbody"

     Sequence "public.publicbody_taggedpublicbody_id_seq"
    Column     |  Type   |               Value                
---------------+---------+------------------------------------
 sequence_name | name    | publicbody_taggedpublicbody_id_seq
 last_value    | bigint  | 4922
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 26
 is_cycled     | boolean | f
 is_called     | boolean | t
Owned by: public.publicbody_taggedpublicbody.id

Index "public.publicbody_taggedpublicbody_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.publicbody_taggedpublicbody"

                                 Table "public.taggit_tag"
 Column |          Type          |                        Modifiers                        
--------+------------------------+---------------------------------------------------------
 id     | integer                | not null default nextval('taggit_tag_id_seq'::regclass)
 name   | character varying(100) | not null
 slug   | character varying(100) | not null
Indexes:
    "taggit_tag_pkey" PRIMARY KEY, btree (id)
    "taggit_tag_name_key" UNIQUE CONSTRAINT, btree (name)
    "taggit_tag_slug_key" UNIQUE CONSTRAINT, btree (slug)
    "taggit_tag_name_58eb2ed9_like" btree (name varchar_pattern_ops)
    "taggit_tag_slug_6be58b2c_like" btree (slug varchar_pattern_ops)
Referenced by:
    TABLE "foirequest_taggedfoirequest" CONSTRAINT "foirequest_taggedfoirequest_tag_id_e80feea1_fk_taggit_tag_id" FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "taggit_taggeditem" CONSTRAINT "taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id" FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED

      Sequence "public.taggit_tag_id_seq"
    Column     |  Type   |        Value        
---------------+---------+---------------------
 sequence_name | name    | taggit_tag_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.taggit_tag.id

 Index "public.taggit_tag_name_58eb2ed9_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 name   | character varying(100) | name
btree, for table "public.taggit_tag"

      Index "public.taggit_tag_name_key"
 Column |          Type          | Definition 
--------+------------------------+------------
 name   | character varying(100) | name
unique, btree, for table "public.taggit_tag"

Index "public.taggit_tag_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.taggit_tag"

 Index "public.taggit_tag_slug_6be58b2c_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(100) | slug
btree, for table "public.taggit_tag"

      Index "public.taggit_tag_slug_key"
 Column |          Type          | Definition 
--------+------------------------+------------
 slug   | character varying(100) | slug
unique, btree, for table "public.taggit_tag"

                              Table "public.taggit_taggeditem"
     Column      |  Type   |                           Modifiers                            
-----------------+---------+----------------------------------------------------------------
 id              | integer | not null default nextval('taggit_taggeditem_id_seq'::regclass)
 object_id       | integer | not null
 content_type_id | integer | not null
 tag_id          | integer | not null
Indexes:
    "taggit_taggeditem_pkey" PRIMARY KEY, btree (id)
    "taggit_taggeditem_417f1b1c" btree (content_type_id)
    "taggit_taggeditem_76f094bc" btree (tag_id)
    "taggit_taggeditem_af31437c" btree (object_id)
    "taggit_taggeditem_content_type_id_196cc965_idx" btree (content_type_id, object_id)
Foreign-key constraints:
    "taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
    "taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id" FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED

  Index "public.taggit_taggeditem_417f1b1c"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 content_type_id | integer | content_type_id
btree, for table "public.taggit_taggeditem"

Index "public.taggit_taggeditem_76f094bc"
 Column |  Type   | Definition 
--------+---------+------------
 tag_id | integer | tag_id
btree, for table "public.taggit_taggeditem"

Index "public.taggit_taggeditem_af31437c"
  Column   |  Type   | Definition 
-----------+---------+------------
 object_id | integer | object_id
btree, for table "public.taggit_taggeditem"

Index "public.taggit_taggeditem_content_type_id_196cc965_idx"
     Column      |  Type   |   Definition    
-----------------+---------+-----------------
 content_type_id | integer | content_type_id
 object_id       | integer | object_id
btree, for table "public.taggit_taggeditem"

     Sequence "public.taggit_taggeditem_id_seq"
    Column     |  Type   |          Value           
---------------+---------+--------------------------
 sequence_name | name    | taggit_taggeditem_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.taggit_taggeditem.id

Index "public.taggit_taggeditem_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.taggit_taggeditem"

                                     Table "public.tastypie_apiaccess"
     Column     |          Type          |                            Modifiers                            
----------------+------------------------+-----------------------------------------------------------------
 id             | integer                | not null default nextval('tastypie_apiaccess_id_seq'::regclass)
 identifier     | character varying(255) | not null
 url            | character varying(255) | not null
 request_method | character varying(10)  | not null
 accessed       | integer                | not null
Indexes:
    "tastypie_apiaccess_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "tastypie_apiaccess_accessed_check" CHECK (accessed >= 0)

     Sequence "public.tastypie_apiaccess_id_seq"
    Column     |  Type   |           Value           
---------------+---------+---------------------------
 sequence_name | name    | tastypie_apiaccess_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.tastypie_apiaccess.id

Index "public.tastypie_apiaccess_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.tastypie_apiaccess"

                                  Table "public.tastypie_apikey"
 Column  |           Type           |                          Modifiers                           
---------+--------------------------+--------------------------------------------------------------
 id      | integer                  | not null default nextval('tastypie_apikey_id_seq'::regclass)
 key     | character varying(128)   | not null
 created | timestamp with time zone | not null
 user_id | integer                  | not null
Indexes:
    "tastypie_apikey_pkey" PRIMARY KEY, btree (id)
    "tastypie_apikey_user_id_key" UNIQUE CONSTRAINT, btree (user_id)
    "tastypie_apikey_3c6e0b8a" btree (key)
    "tastypie_apikey_key_17b411bb_like" btree (key varchar_pattern_ops)
Foreign-key constraints:
    "tastypie_apikey_user_id_8c8fa920_fk_account_user_id" FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED

   Index "public.tastypie_apikey_3c6e0b8a"
 Column |          Type          | Definition 
--------+------------------------+------------
 key    | character varying(128) | key
btree, for table "public.tastypie_apikey"

     Sequence "public.tastypie_apikey_id_seq"
    Column     |  Type   |         Value          
---------------+---------+------------------------
 sequence_name | name    | tastypie_apikey_id_seq
 last_value    | bigint  | 1
 start_value   | bigint  | 1
 increment_by  | bigint  | 1
 max_value     | bigint  | 9223372036854775807
 min_value     | bigint  | 1
 cache_value   | bigint  | 1
 log_cnt       | bigint  | 0
 is_cycled     | boolean | f
 is_called     | boolean | f
Owned by: public.tastypie_apikey.id

Index "public.tastypie_apikey_key_17b411bb_like"
 Column |          Type          | Definition 
--------+------------------------+------------
 key    | character varying(128) | key
btree, for table "public.tastypie_apikey"

Index "public.tastypie_apikey_pkey"
 Column |  Type   | Definition 
--------+---------+------------
 id     | integer | id
primary key, btree, for table "public.tastypie_apikey"

Index "public.tastypie_apikey_user_id_key"
 Column  |  Type   | Definition 
---------+---------+------------
 user_id | integer | user_id
unique, btree, for table "public.tastypie_apikey"

