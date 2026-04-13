---
title: "WindowClient: ancestorOrigins property"
short-title: ancestorOrigins
slug: Web/API/WindowClient/ancestorOrigins
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WindowClient.ancestorOrigins
---

{{APIRef("Service Workers API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`ancestorOrigins`** của giao diện {{domxref("WindowClient")}} là một mảng các chuỗi liệt kê các nguồn gốc của tất cả tổ tiên của ngữ cảnh duyệt web được đại diện bởi `WindowClient` này theo thứ tự ngược.

Phần tử đầu tiên trong mảng là nguồn gốc của cửa sổ cha của cửa sổ này, và phần tử cuối cùng là nguồn gốc của ngữ cảnh duyệt web cấp cao nhất. Nếu cửa sổ này chính là ngữ cảnh duyệt web cấp cao nhất, thì `ancestorOrigins` là một mảng rỗng.

## Giá trị

Một mảng các chuỗi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
