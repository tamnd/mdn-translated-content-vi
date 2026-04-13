---
title: SyncEvent
slug: Web/API/SyncEvent
page-type: web-api-interface
browser-compat: api.SyncEvent
---

{{APIRef("Background Sync")}}{{AvailableInWorkers("service")}}

Giao diện **`SyncEvent`** của {{domxref("Background Synchronization API", "", "", "nocode")}} đại diện cho hành động đồng bộ hóa được phân phối trên {{domxref("ServiceWorkerGlobalScope")}} của ServiceWorker.

Giao diện này kế thừa từ giao diện {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SyncEvent.SyncEvent", "SyncEvent()")}}
  - : Tạo đối tượng `SyncEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("ExtendableEvent")}} và {{domxref("Event")}}_.

- {{domxref("SyncEvent.tag")}} {{ReadOnlyInline}}
  - : Trả về mã định danh do nhà phát triển định nghĩa cho `SyncEvent` này.
- {{domxref("SyncEvent.lastChance")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu tác nhân người dùng sẽ không thực hiện thêm các lần thử đồng bộ hóa sau lần thử hiện tại.

## Phương thức phiên bản

_Kế thừa các phương thức từ cha, {{domxref("ExtendableEvent")}} và {{domxref("Event")}}_.

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
