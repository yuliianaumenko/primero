def create_or_update_role(role_hash)
  role_id = Role.id_from_name role_hash[:name]
  role = Role.get role_id

  if role.nil?
    puts "Creating role #{role_id}"
    Role.create! role_hash
  else
    puts "Updating role #{role_id}"
    role.update_attributes role_hash
  end

end

cp_admin_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::CONSENT_OVERRIDE,
      Permission::IMPORT,
      Permission::REFERRAL,
      Permission::TRANSFER,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::SEARCH_OWNED_BY_OTHERS,
      Permission::CREATE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::ENABLE_DISABLE_RECORD
    ]
  ),
  Permission.new(
    :resource => Permission::TRACING_REQUEST,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::IMPORT,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR,
      Permission::CREATE
    ]
  ),
  Permission.new(
    :resource => Permission::ROLE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::ASSIGN,
      Permission::IMPORT,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PDF,
      Permission::CREATE
    ],
    :role_ids => [
      'role-cp-case-worker',
      'role-cp-manager',
      'role-cp-user-manager',
      'role-referral',
      'role-transfer'
    ]
  ),
  Permission.new(
    :resource => Permission::USER,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  ),
  Permission.new(
      :resource => Permission::USER_GROUP,
      :actions => [
          Permission::READ,
          Permission::WRITE,
          Permission::CREATE,
          Permission::ASSIGN
      ]
  ),
  Permission.new(
      :resource => Permission::AGENCY,
      :actions => [
          Permission::READ,
          Permission::WRITE,
          Permission::CREATE
      ]
  ),
  Permission.new(
    :resource => Permission::REPORT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  ),
  Permission.new(
    :resource => Permission::METADATA,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::SYSTEM,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  )
]

create_or_update_role(
  :name => "CP Administrator",
  :permissions_list => cp_admin_permissions,
  :group_permission => Permission::ALL
)


cp_caseworker_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::SYNC_MOBILE,
      Permission::REQUEST_APPROVAL_CASE_PLAN,
      Permission::SEARCH_OWNED_BY_OTHERS,
      Permission::INCIDENT_FROM_CASE,
      Permission::CREATE,
      Permission::REFERRAL_FROM_SERVICE,
      Permission::REFERRAL,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::REMOVE_ASSIGNED_USERS,
      Permission::ENABLE_DISABLE_RECORD
    ]
  ),
  Permission.new(
    :resource => Permission::TRACING_REQUEST,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR,
      Permission::CREATE
    ]
  ),
  Permission.new(
    :resource => Permission::POTENTIAL_MATCH,
    :actions => [
      Permission::READ
    ]
  ),
  Permission.new(
    :resource => Permission::DASHBOARD,
    :actions => [
      Permission::VIEW_APPROVALS,
      Permission::VIEW_ASSESSMENT,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::DASH_TASKS
    ]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  )
]

create_or_update_role(
  :name => "CP Case Worker",
  :permissions_list => cp_caseworker_permissions
)

cp_manager_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::REASSIGN,
      Permission::CONSENT_OVERRIDE,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::SYNC_MOBILE,
      Permission::APPROVE_CASE_PLAN,
      Permission::SEARCH_OWNED_BY_OTHERS,
      Permission::INCIDENT_FROM_CASE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::ENABLE_DISABLE_RECORD
    ]
  ),
  Permission.new(
    :resource => Permission::TRACING_REQUEST,
    :actions => [
      Permission::READ,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR
    ]
  ),
    Permission.new(
    :resource => Permission::POTENTIAL_MATCH,
    :actions => [
      Permission::READ
    ]
  ),
  Permission.new(
    :resource => Permission::REPORT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  ),
  Permission.new(
    :resource => Permission::ROLE,
    :actions => [
      Permission::READ,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PDF
    ]
  ),
  Permission.new(
    :resource => Permission::USER,
    :actions => [
      Permission::READ
    ]
  ),
  Permission.new(
      :resource => Permission::USER_GROUP,
      :actions => [
          Permission::READ
      ]
  ),
  Permission.new(
      :resource => Permission::AGENCY,
      :actions => [
          Permission::READ
      ]
  ),
  Permission.new(
      :resource => Permission::DASHBOARD,
      :actions => [
        Permission::VIEW_APPROVALS,
        Permission::VIEW_ASSESSMENT,
        Permission::VIEW_PROTECTION_CONCERNS_FILTER,
        Permission::DASH_CASES_BY_TASK_OVERDUE
      ]
  )
]

create_or_update_role(
  :name => "CP Manager",
  :permissions_list => cp_manager_permissions,
  :group_permission => Permission::GROUP
)

cp_user_manager_permissions = [
    Permission.new(
        :resource => Permission::CASE,
        :actions => [
            Permission::READ,
            Permission::FLAG,
            Permission::ASSIGN,
            Permission::REASSIGN,
            Permission::CONSENT_OVERRIDE,
            Permission::EXPORT_CUSTOM,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PHOTO_WALL,
            Permission::EXPORT_PDF,
            Permission::EXPORT_CASE_PDF,
            Permission::EXPORT_UNHCR,
            Permission::SYNC_MOBILE,
            Permission::APPROVE_CASE_PLAN,
            Permission::VIEW_PROTECTION_CONCERNS_FILTER
        ]
    ),
    Permission.new(
        :resource => Permission::TRACING_REQUEST,
        :actions => [
            Permission::READ,
            Permission::FLAG,
            Permission::ASSIGN,
            Permission::EXPORT_CUSTOM,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PHOTO_WALL,
            Permission::EXPORT_PDF,
            Permission::EXPORT_UNHCR
        ]
    ),
    Permission.new(
        :resource => Permission::POTENTIAL_MATCH,
        :actions => [
            Permission::READ
        ]
    ),
    Permission.new(
        :resource => Permission::REPORT,
        :actions => [
            Permission::READ,
            Permission::WRITE
        ]
    ),
    Permission.new(
        :resource => Permission::ROLE,
        :actions => [
            Permission::READ,
            Permission::ASSIGN,
            Permission::EXPORT_CUSTOM,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PDF
        ]
    ),
    Permission.new(
        :resource => Permission::USER,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE
        ]
    ),
    Permission.new(
        :resource => Permission::USER_GROUP,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE,
            Permission::ASSIGN
        ]
    ),
    Permission.new(
        :resource => Permission::AGENCY,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE
        ]
    ),
    Permission.new(
        :resource => Permission::DASHBOARD,
        :actions => [
          Permission::VIEW_APPROVALS,
          Permission::VIEW_ASSESSMENT,
          Permission::VIEW_PROTECTION_CONCERNS_FILTER
        ]
    )
]

create_or_update_role(
    :name => "CP User Manager",
    :permissions_list => cp_user_manager_permissions,
    :group_permission => Permission::GROUP
)

gbv_worker_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::SYNC_MOBILE,
      Permission::INCIDENT_FROM_CASE,
      Permission::CREATE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::ENABLE_DISABLE_RECORD
    ]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR,
      Permission::EXPORT_INCIDENT_RECORDER,
      Permission::SYNC_MOBILE,
      Permission::CREATE
    ]
  )
]

create_or_update_role(
  :name => "GBV Social Worker",
  :permissions_list => gbv_worker_permissions
)

gbv_manager_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::CONSENT_OVERRIDE,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::SYNC_MOBILE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER,
      Permission::REMOVE_ASSIGNED_USERS,
      Permission::ENABLE_DISABLE_RECORD
    ]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [
      Permission::READ,
      Permission::FLAG,
      Permission::ASSIGN,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR,
      Permission::EXPORT_INCIDENT_RECORDER,
      Permission::SYNC_MOBILE
    ]
  ),
  Permission.new(
    :resource => Permission::REPORT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  ),
  Permission.new(
    :resource => Permission::ROLE,
    :actions => [
      Permission::READ,
      Permission::EXPORT_CUSTOM,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_UNHCR
    ]
  ),
  Permission.new(
    :resource => Permission::USER,
    :actions => [
      Permission::READ
    ]
  ),
  Permission.new(
      :resource => Permission::USER_GROUP,
      :actions => [
          Permission::READ
      ]
  ),
  Permission.new(
      :resource => Permission::AGENCY,
      :actions => [
          Permission::READ
      ]
  )
]

create_or_update_role(
    :name => "GBV Manager",
    :permissions_list => gbv_manager_permissions,
    :group_permission => Permission::GROUP
)

gbv_user_manager_permissions = [
    Permission.new(
        :resource => Permission::CASE,
        :actions => [
            Permission::READ,
            Permission::FLAG,
            Permission::ASSIGN,
            Permission::CONSENT_OVERRIDE,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PHOTO_WALL,
            Permission::EXPORT_PDF,
            Permission::EXPORT_CASE_PDF,
            Permission::EXPORT_UNHCR,
            Permission::SYNC_MOBILE,
            Permission::VIEW_PROTECTION_CONCERNS_FILTER
        ]
    ),
    Permission.new(
        :resource => Permission::INCIDENT,
        :actions => [
            Permission::READ,
            Permission::FLAG,
            Permission::ASSIGN,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PHOTO_WALL,
            Permission::EXPORT_PDF,
            Permission::EXPORT_UNHCR,
            Permission::EXPORT_INCIDENT_RECORDER,
            Permission::SYNC_MOBILE
        ]
    ),
    Permission.new(
        :resource => Permission::REPORT,
        :actions => [
            Permission::READ,
            Permission::WRITE
        ]
    ),
    Permission.new(
        :resource => Permission::ROLE,
        :actions => [
            Permission::READ,
            Permission::ASSIGN,
            Permission::EXPORT_CUSTOM,
            Permission::EXPORT_LIST_VIEW,
            Permission::EXPORT_CSV,
            Permission::EXPORT_EXCEL,
            Permission::EXPORT_JSON,
            Permission::EXPORT_PHOTO_WALL,
            Permission::EXPORT_PDF,
            Permission::EXPORT_UNHCR
        ]
    ),
    Permission.new(
        :resource => Permission::USER,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE
        ]
    ),
    Permission.new(
        :resource => Permission::USER_GROUP,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE,
            Permission::ASSIGN
        ]
    ),
    Permission.new(
        :resource => Permission::AGENCY,
        :actions => [
            Permission::READ,
            Permission::CREATE,
            Permission::WRITE
        ]
    )
]

create_or_update_role(
    :name => "GBV User Manager",
    :permissions_list => gbv_user_manager_permissions,
    :group_permission => Permission::GROUP
)

referral_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::CREATE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER
    ]
  )
]

create_or_update_role(
  :name => "Referral",
  :permissions_list => referral_permissions,
  :referral => true
)

transfer_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::FLAG,
      Permission::EXPORT_LIST_VIEW,
      Permission::EXPORT_CSV,
      Permission::EXPORT_EXCEL,
      Permission::EXPORT_JSON,
      Permission::EXPORT_PHOTO_WALL,
      Permission::EXPORT_PDF,
      Permission::EXPORT_CASE_PDF,
      Permission::EXPORT_UNHCR,
      Permission::CREATE,
      Permission::VIEW_PROTECTION_CONCERNS_FILTER
    ]
  )
]

create_or_update_role(
  :name => "Transfer",
  :permissions_list => transfer_permissions,
  :transfer => true
)

ftr_manager_permissions = [
  Permission.new(
      :resource => Permission::CASE,
      :actions => [
          Permission::READ,
          Permission::WRITE,
          Permission::FLAG,
          Permission::EXPORT_LIST_VIEW,
          Permission::EXPORT_CSV,
          Permission::EXPORT_EXCEL,
          Permission::EXPORT_JSON,
          Permission::EXPORT_PHOTO_WALL,
          Permission::EXPORT_PDF,
          Permission::EXPORT_CASE_PDF,
          Permission::EXPORT_UNHCR,
          Permission::SYNC_MOBILE,
          Permission::CREATE,
          Permission::VIEW_PROTECTION_CONCERNS_FILTER
      ]
  ),
  Permission.new(
      :resource => Permission::TRACING_REQUEST,
      :actions => [
          Permission::READ,
          Permission::WRITE,
          Permission::FLAG,
          Permission::EXPORT_LIST_VIEW,
          Permission::EXPORT_CSV,
          Permission::EXPORT_EXCEL,
          Permission::EXPORT_JSON,
          Permission::EXPORT_PHOTO_WALL,
          Permission::EXPORT_PDF,
          Permission::EXPORT_UNHCR,
          Permission::CREATE
      ]
  ),
  Permission.new(
    :resource => Permission::POTENTIAL_MATCH,
    :actions => [
      Permission::READ
    ]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [
      Permission::READ,
      Permission::WRITE,
      Permission::CREATE
    ]
  )
]

create_or_update_role(
    :name => "FTR Manager",
    :permissions_list => ftr_manager_permissions
)

superuser_permissions = [
  Permission.new(
    :resource => Permission::CASE,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::INCIDENT,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::TRACING_REQUEST,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::POTENTIAL_MATCH,
    :actions => [Permission::READ]
  ),
  Permission.new(
    :resource => Permission::REPORT,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::ROLE,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::USER,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
      :resource => Permission::USER_GROUP,
      :actions => [Permission::MANAGE]
  ),
  Permission.new(
      :resource => Permission::AGENCY,
      :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::METADATA,
    :actions => [Permission::MANAGE]
  ),
  Permission.new(
    :resource => Permission::SYSTEM,
    :actions => [Permission::MANAGE]
  )
]

create_or_update_role(
  :name => "Superuser",
  :permissions_list => superuser_permissions,
  :group_permission => Permission::ALL
)

