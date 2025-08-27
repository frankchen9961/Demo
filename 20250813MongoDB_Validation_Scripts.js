// MongoDB Schema Validation Scripts
// 為三個 collection 建立 schema validation

// 1. Documents Collection Schema Validation
// Drop collection if exists
try {
  db.documents.drop();
  print("已刪除現有的 documents collection");
} catch (e) {
  print("documents collection 不存在，跳過刪除");
}

db.createCollection("documents", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "_id",
        "title",
        "doc_type",
        "enable",
        "current_version_id",
        "category_id",
        "source_info",
        "permissions",
        "domain_id",
        "subdomain_id",
        "audit_info",
      ],
      additionalProperties: false,
      properties: {
        _id: {
          bsonType: "objectId",
          description: "文件唯一識別碼",
        },
        title: {
          bsonType: "string",
          description: "文件標題",
        },
        doc_type: {
          bsonType: "string",
          enum: [common, guideline],
          description: "文件類型: common-一般文件, guideline-準則",
        },
        current_version_id: {
          bsonType: "objectId",
          description: "當前版本ID",
        },
        enable: {
          bsonType: "bool",
          description: "是否啟用",
        },
        domain_id: {
          bsonType: "long",
          description: "文件所主館ID",
        },
        subdomain_id: {
          bsonType: "long",
          description: "文件所屬分館ID",
        },
        category_id: {
          bsonType: "long",
          description: "文件分類ID",
        },
        source_info: {
          bsonType: "object",
          description: "來源資訊",
          properties: {
            source: {
              bsonType: "int",
              enum: [1, 2, 3, 4],
              description:
                "來源類型: 1-直接建立, 2-匯入, 3-KM同步, 4-Sales Portal同步",
            },
            source_id: {
              bsonType: ["string", "null"],
              description: "來源ID",
            },
            sycn_target: {
              bsonType: ["string", "null"],
              enum: [null, SP, KM],
              description: "同步目標",
            },
            source_extra_data: {
              bsonType: ["string", "null"],
              description: "來源額外資料",
            },
            last_sync_t_no: {
              bsonType: ["string", "null"],
              description: "最後同步交易編號",
            },
            last_sync_status: {
              bsonType: ["int", "null"],
              enum: [null, 1, 2, 3],
              description: "最後同步狀態: 1-同步中, 2-同步成功, 3-同步失敗",
            },
            last_sync_time: {
              bsonType: ["date", "null"],
              description: "最後同步時間",
            },
            source_sync_log: {
              bsonType: ["array", "null"],
              description: "同步記錄",
              items: {
                bsonType: "object",
                properties: {
                  direction: {
                    bsonType: "string",
                    enum: ["IN", "OUT"],
                    description: "同步方向",
                  },
                  sync_t_no: {
                    bsonType: ["string", "null"],
                    description: "同步交易編號",
                  },
                  sync_version_id: {
                    bsonType: "string",
                    description: "同步版本ID",
                  },
                  sync_status: {
                    bsonType: "string",
                    enum: ["Syncing", "Completed"],
                    description: "同步狀態",
                  },
                  sync_time: {
                    bsonType: "date",
                    description: "開始同步時間",
                  },
                  sync_complete_time: {
                    bsonType: "date",
                    description: "同步完成時間",
                  },
                  message: {
                    bsonType: "string",
                    description: "同步訊息",
                  },
                },
              },
            },
          },
        },
        permissions: {
          bsonType: "object",
          description: "權限設定",
          properties: {
            owner_department: {
              bsonType: "long",
              description: "文件擁有部門ID",
            },
            all_departments: {
              bsonType: "bool",
              description: "是否開放給所有部門",
            },
            authorized_departments: {
              bsonType: "array",
              description: "授權部門列表",
              items: {
                bsonType: "object",
                required: ["department_id"],
                properties: {
                  department_id: {
                    bsonType: "long",
                    description: "部門ID",
                  },
                },
              },
            },
          },
        },
        doc_link: {
          bsonType: "object",
          description: "文件關聯資訊",
          properties: {
            active_link: {
              bsonType: "array",
              description: "主動連結的文件列表",
              items: {
                bsonType: "object",
                required: ["document_id", "link_time", "creator", "ouid"],
                properties: {
                  document_id: {
                    bsonType: "objectId",
                    description: "連結的文件ID",
                  },
                  link_time: {
                    bsonType: "date",
                    description: "連結時間",
                  },
                  creator: {
                    bsonType: "string",
                    description: "建立人員",
                  },
                  ouid: {
                    bsonType: "string",
                    description: "建立單位",
                  },
                },
              },
            },
            passive_link: {
              bsonType: "array",
              description: "被動連結的文件列表",
              items: {
                bsonType: "object",
                required: ["document_id", "link_time", "creator", "ouid"],
                properties: {
                  document_id: {
                    bsonType: "objectId",
                    description: "連結的文件ID",
                  },
                  link_time: {
                    bsonType: "date",
                    description: "連結時間",
                  },
                  creator: {
                    bsonType: "string",
                    description: "建立人員",
                  },
                  ouid: {
                    bsonType: "string",
                    description: "建立單位",
                  },
                },
              },
            },
          },
        },
        audit_info: {
          bsonType: "object",
          required: ["create_time", "creator", "modify_time", "modifier"],
          additionalProperties: false,
          properties: {
            create_time: {
              bsonType: "date",
              description: "建立時間",
            },
            creator: {
              bsonType: "string",
              description: "建立人員",
            },
            modify_time: {
              bsonType: "date",
              description: "最後修改時間",
            },
            modifier: {
              bsonType: "string",
              description: "最後修改人員",
            },
          },
        },
      },
    },
  },
});

// 2. Document Versions Collection Schema Validation
// Drop collection if exists
try {
  db.document_versions.drop();
  print("已刪除現有的 document_versions collection");
} catch (e) {
  print("document_versions collection 不存在，跳過刪除");
}

db.createCollection("document_versions", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "_id",
        "document_id",
        "document_title",
        "version_number",
        "is_current",
        "draft",
        "start_time",
        "end_time",
        "enable",
        "doc_type",
        "category_id",
        "content",
        "content_type",
        "summary",
        "verify_info",
        "tags",
        "attachment",
        "knowledge_bases",
        "audit_info",
        "permissions",
      ],
      additionalProperties: false,
      properties: {
        _id: {
          bsonType: "objectId",
          description: "版本唯一識別碼",
        },
        document_id: {
          bsonType: "objectId",
          description: "對應的文件ID",
        },
        document_title: {
          bsonType: "string",
          description: "對應的文件標題",
        },
        version_number: {
          bsonType: "decimal",
          description: "版本號碼",
        },
        is_current: {
          bsonType: "bool",
          description: "是否為當前版本",
        },
        draft: {
          bsonType: "bool",
          description: "是否為草稿",
        },
        start_time: {
          bsonType: "date",
          description: "版本生效時間",
        },
        end_time: {
          bsonType: "date",
          description: "版本失效時間",
        },
        enable: {
          bsonType: "bool",
          description: "是否啟用",
        },
        doc_type: {
          bsonType: "string",
          enum: ["common", "guideline"],
          description: "文件類型: common-一般文件, guideline-準則",
        },
        category_id: {
          bsonType: "long",
          description: "文件分類ID",
        },
        content: {
          bsonType: "string",
          description: "版本內容",
        },
        content_type: {
          bsonType: "string",
          enum: ["markdown"],
          description: "內容格式",
        },
        summary: {
          bsonType: "string",
          description: "內容摘要",
        },
        current_verify_flow_id: {
          bsonType: "long",
          description: "當前審核流程ID",
        },
        permissions: {
          bsonType: "object",
          description: "權限設定",
          properties: {
            owner_department: {
              bsonType: "long",
              description: "文件擁有部門ID",
            },
            all_departments: {
              bsonType: "bool",
              description: "是否開放給所有部門",
            },
            authorized_departments: {
              bsonType: "array",
              description: "授權部門列表",
              items: {
                bsonType: "object",
                required: ["department_id", "is_doc_owner"],
                properties: {
                  department_id: {
                    bsonType: "long",
                    description: "部門ID",
                  },
                },
              },
            },
          },
        },
        verify_info: {
          bsonType: "object",
          description: "審核資訊",
          properties: {
            verify_status: {
              bsonType: "int",
              enum: [-1, 0, 1, 2],
              description: "審核狀態:-1-無須審核, 0-退回, 1-審核中, 2-審核完成",
            },
            verify_user_id: {
              bsonType: ["string", "null"],
              description: "送審人員ID",
            },
            verify_time: {
              bsonType: ["date", "null"],
              description: "送審時間",
            },
          },
        },
        tags: {
          bsonType: "array",
          description: "文件標籤列表",
          items: {
            bsonType: "object",
            required: ["tag_id", "tag_key", "tag_value"],
            properties: {
              tag_id: {
                bsonType: "long",
                description: "標籤ID",
              },
              tag_key: {
                bsonType: "string",
                description: "標籤鍵",
              },
              tag_value: {
                bsonType: "string",
                description: "標籤值",
              },
            },
          },
        },
        attachment: {
          bsonType: "array",
          description: "版本附件列表",
          items: {
            bsonType: "object",
            required: [
              "file_uuid",
              "file_name",
              "file_size",
              "file_type",
              "bind_type",
            ],
            additionalProperties: false,
            properties: {
              file_uuid: {
                bsonType: "string",
                description: "附件檔案UUID",
              },
              file_name: {
                bsonType: "string",
                description: "附件檔案名稱",
              },
              file_size: {
                bsonType: "long",
                description: "附件檔案大小",
              },
              file_type: {
                bsonType: "string",
                description: "附件檔案類型",
              },
              bind_type: {
                bsonType: "int",
                enum: [0, 1, 2],
                description: "關聯類型: 0-其他類型, 1-文件關聯, 2-內容關聯",
              },
            },
          },
        },
        knowledge_bases: {
          bsonType: "array",
          description: "關聯知識庫列表",
          items: {
            bsonType: "object",
            required: [
              "knowledge_base_version_id",
              "knowledge_base_version_doc_enable",
            ],
            properties: {
              knowledge_base_version_id: {
                bsonType: "long",
                description: "知識庫ID",
              },
              knowledge_base_version_doc_enable: {
                bsonType: "bool",
                description: "知識庫是否啟用文件關聯",
              },
            },
          },
        },
        audit_info: {
          bsonType: "object",
          required: ["create_time", "creator", "modify_time", "modifier"],
          additionalProperties: false,
          properties: {
            create_time: {
              bsonType: "date",
              description: "建立時間",
            },
            creator: {
              bsonType: "string",
              description: "建立人員",
            },
            modify_time: {
              bsonType: "date",
              description: "最後修改時間",
            },
            modifier: {
              bsonType: "string",
              description: "最後修改人員",
            },
          },
        },
      },
    },
  },
});

// 3. Document Chunks Collection Schema Validation
// 注意：根據描述這是動態 collection 名稱 KB_{ID}_V_{版本號碼整數}_{版本號碼小數}
// 這裡提供一個通用的函數來創建 chunks collection
function createChunksCollection(collectionName) {
  // Drop collection if exists
  try {
    db.getCollection(collectionName).drop();
    print("已刪除現有的 " + collectionName + " collection");
  } catch (e) {
    print(collectionName + " collection 不存在，跳過刪除");
  }

  db.createCollection(collectionName, {
    validator: {
      $jsonSchema: {
        bsonType: "object",
        required: [
          "_id",
          "scenario_id",
          "knowledgebase_version_id",
          "doc_info",
          "chunk_sequence",
          "chunk_title",
          "content",
          "embedding",
          "tags",
          "enable_status",
          "chunk_source",
          "audit_info",
        ],
        additionalProperties: false,
        properties: {
          _id: {
            bsonType: "objectId",
            description: "切片唯一識別碼",
          },
          scenario_id: {
            bsonType: "long",
            description: "應用場景ID",
          },
          knowledgebase_version_id: {
            bsonType: "long",
            description: "知識庫版本ID",
          },
          doc_info: {
            bsonType: "object",
            description: "文件資訊",
            properties: {
              doc_version_id: {
                bsonType: "objectId",
                description: "對應文件版本ID",
              },
              doc_version_num: {
                bsonType: "decimal",
                description: "對應文件版本號",
              },
              doc_version_start_time: {
                bsonType: "date",
                description: "文件版本上架時間",
              },
              doc_version_end_time: {
                bsonType: "date",
                description: "文件版本下架時間",
              },
            },
          },
          chunk_sequence: {
            bsonType: "int",
            description: "切片順序編號",
          },
          chunk_title: {
            bsonType: "string",
            description: "切片標題",
          },
          content: {
            bsonType: "string",
            description: "切片內容",
          },
          md5_content: {
            bsonType: "string",
            description: "切片內容的MD5雜湊值",
          },
          embedding: {
            bsonType: "array",
            items: {
              bsonType: "double",
            },
            description: "向量表示 (embedding)",
          },
          tags: {
            bsonType: "array",
            description: "標籤列表",
            items: {
              bsonType: "object",
              required: ["tag_id", "tag_key", "tag_value"],
              additionalProperties: false,
              properties: {
                tag_id: {
                  bsonType: "long",
                  description: "標籤ID",
                },
                tag_key: {
                  bsonType: "string",
                  description: "標籤鍵",
                },
                tag_value: {
                  bsonType: "string",
                  description: "標籤值",
                },
              },
            },
          },
          enable_status: {
            bsonType: "object",
            description: "啟用狀態",
            properties: {
              knowledge_base_doc_enable: {
                bsonType: "bool",
                description: "知識庫文件啟用狀態: true-啟用, false-停用",
              },
              knowledge_base_enable: {
                bsonType: "bool",
                description: "知識庫啟用狀態: true-啟用, false-停用",
              },
              enable: {
                bsonType: "bool",
                description: "切片啟用狀態: true-啟用, false-停用",
              },
            },
          },
          chunk_source: {
            bsonType: "string",
            enum: ["manual", "auto"],
            description: "切片產生來源: manual(手動), auto(自動)",
          },
          audit_info: {
            bsonType: "object",
            required: ["create_time", "creator", "modify_time", "modifier"],
            additionalProperties: false,
            properties: {
              create_time: {
                bsonType: "date",
                description: "建立時間",
              },
              creator: {
                bsonType: "string",
                description: "建立人員",
              },
              modify_time: {
                bsonType: "date",
                description: "最後修改時間",
              },
              modifier: {
                bsonType: "string",
                description: "最後修改人員",
              },
            },
          },
        },
      },
    },
  });
}

// 範例：建立具體的 chunks collection
// createChunksCollection("KB_1_V_1_0");
// createChunksCollection("KB_2001_V_1");

// 完整建立所有 collections 的函數
function setupAllCollections() {
  print("=== 開始建立所有 MongoDB Collections 與 Schema Validation ===");

  // 建立基本 collections
  print("建立 documents collection...");
  // documents collection 已在上方建立

  print("建立 document_versions collection...");
  // document_versions collection 已在上方建立

  // 建立範例 chunks collections
  print("建立 chunks collections...");
  createChunksCollection("KB_1_V_1_0");
  createChunksCollection("KB_2001_V_1");

  print("=== 所有 Collections 建立完成 ===");
}

// 執行建立所有 collections (取消註解以執行)
// setupAllCollections();

print("MongoDB Schema Validation 腳本建立完成！");
print("已建立的驗證規則：");
print("1. documents collection - 文件主檔");
print("2. document_versions collection - 文件版本");
print("3. createChunksCollection() function - 文件切片 (動態命名)");
print("4. setupAllCollections() function - 一次建立所有 collections");
print("");
print("執行方式：");
print("1. 執行整個腳本會建立 documents 和 document_versions collections");
print(
  "2. 呼叫 createChunksCollection('collection_name') 建立特定的 chunks collection"
);
print("3. 呼叫 setupAllCollections() 一次建立所有 collections");
print("請注意：每次執行前會自動刪除現有的 collections！");
