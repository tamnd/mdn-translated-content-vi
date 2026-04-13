---
title: "HTMLElement: thuộc tính offsetParent"
short-title: offsetParent
slug: Web/API/HTMLElement/offsetParent
page-type: web-api-instance-property
browser-compat: api.HTMLElement.offsetParent
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`HTMLElement.offsetParent`** trả về tham chiếu đến phần tử là tổ tiên được định vị gần nhất (gần nhất trong hệ thống phân cấp chứa).

Tổ tiên được định vị có thể là:

- Một [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block) cho các phần tử được định vị tuyệt đối
- Một phần tử có giá trị [zoom](/en-US/docs/Web/CSS/Reference/Properties/zoom) hiệu quả khác (nghĩa là tích của tất cả tỷ lệ zoom của các phần tử cha) so với phần tử này
- `td`, `th`, `table` trong trường hợp bản thân phần tử được định vị tĩnh.

Nếu không có phần tử tổ tiên được định vị, `body` sẽ được trả về.

> [!NOTE]
> `offsetParent` trả về `null` trong các trường hợp sau:
>
> - Phần tử hoặc bất kỳ tổ tiên nào có thuộc tính `display` được đặt thành `none`.
> - Phần tử có thuộc tính `position` được đặt thành `fixed` và khối chứa của nó là viewport.
>   Nếu khối chứa không phải là viewport, `offsetParent` trả về tổ tiên gần nhất tạo thành khối chứa, ví dụ: tổ tiên có kiểu `transform`, `perspective` hoặc `filter`.
> - Phần tử là `<body>` hoặc `<html>`.

`offsetParent` hữu ích vì
{{domxref("HTMLElement.offsetTop","offsetTop")}} và
{{domxref("HTMLElement.offsetLeft","offsetLeft")}} tính tương đối với cạnh padding của nó.

## Giá trị

Tham chiếu đối tượng đến phần tử mà phần tử hiện tại bị lệch.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
