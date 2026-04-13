---
title: "SyncEvent: thuộc tính lastChance"
short-title: lastChance
slug: Web/API/SyncEvent/lastChance
page-type: web-api-instance-property
browser-compat: api.SyncEvent.lastChance
---

{{APIRef("Background Sync")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`lastChance`** của giao diện {{domxref("SyncEvent")}} trả về `true` nếu tác nhân người dùng sẽ không thực hiện thêm các lần thử đồng bộ hóa sau lần thử hiện tại. Đây là giá trị được truyền trong tham số `lastChance` của hàm khởi tạo {{domxref("SyncEvent.SyncEvent","SyncEvent()")}}.

## Giá trị

Một giá trị boolean cho biết tác nhân người dùng sẽ không thực hiện thêm các lần thử đồng bộ hóa sau lần thử hiện tại hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
