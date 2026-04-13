---
title: "HTMLElement: thuộc tính autofocus"
short-title: autofocus
slug: Web/API/HTMLElement/autofocus
page-type: web-api-instance-property
browser-compat: api.HTMLElement.autofocus
---

{{APIRef("HTML DOM")}}

Thuộc tính **`autofocus`** của giao diện {{domxref("HTMLElement")}} thể hiện một giá trị kiểu logic phản ánh thuộc tính toàn cục HTML [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus). Thuộc tính này cho biết liệu phần tử có được lấy tiêu điểm khi tải trang hay không, hoặc nếu nó được lồng bên trong phần tử {{htmlelement("dialog")}} hoặc [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), khi `<dialog>` hoặc popover được hiển thị.

Chỉ một phần tử trong tài liệu, phần tử `<dialog>` hoặc popover có thể được chỉ định thuộc tính này. Nếu áp dụng cho nhiều phần tử, phần tử có thể lấy tiêu điểm đầu tiên sẽ nhận tiêu điểm.

> [!NOTE]
> Việc thiết lập thuộc tính này không đặt tiêu điểm cho phần tử liên quan: nó chỉ yêu cầu trình duyệt lấy tiêu điểm khi _phần tử được chèn_ vào tài liệu. Việc thiết lập nó sau khi chèn, tức là hầu hết các trường hợp sau khi tải tài liệu, không có hiệu ứng hiển thị.

## Giá trị

Một giá trị kiểu logic.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
