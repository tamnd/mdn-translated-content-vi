---
title: SyncManager
slug: Web/API/SyncManager
page-type: web-api-interface
browser-compat: api.SyncManager
---

{{APIRef("Background Sync")}}{{AvailableInWorkers}}

Giao diện **`SyncManager`** của {{domxref("Background Synchronization API", "", "", "nocode")}} cung cấp giao diện để đăng ký và liệt kê các đăng ký đồng bộ.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref("SyncManager.register()")}}
  - : Tạo một đăng ký đồng bộ mới và trả về một {{jsxref("Promise")}}.
- {{domxref("SyncManager.getTags()")}}
  - : Trả về danh sách các định danh do nhà phát triển xác định cho các đăng ký `SyncManager`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
