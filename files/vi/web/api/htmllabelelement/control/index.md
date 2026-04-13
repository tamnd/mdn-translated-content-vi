---
title: "HTMLLabelElement: thuộc tính control"
short-title: control
slug: Web/API/HTMLLabelElement/control
page-type: web-api-instance-property
browser-compat: api.HTMLLabelElement.control
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`HTMLLabelElement.control`** trả về một tham chiếu đến điều khiển (dưới dạng đối tượng thuộc kiểu {{domxref("HTMLElement")}} hoặc một trong các dẫn xuất của nó) mà phần tử {{HTMLElement("label")}} liên kết, hoặc `null` nếu nhãn không liên kết với điều khiển nào.

## Giá trị

Một đối tượng dẫn xuất từ {{domxref("HTMLElement")}} đại diện cho điều khiển mà {{HTMLElement("label")}} liên kết, hoặc `null` nếu nhãn đứng độc lập.

> [!NOTE]
> Nếu thuộc tính này có giá trị và {{domxref("HTMLLabelElement.htmlFor")}} có giá trị, thuộc tính {{domxref("HTMLLabelElement.htmlFor")}} phải tham chiếu đến cùng một điều khiển.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLabelElement")}}
- {{domxref("HTMLElement")}}
- {{HTMLElement("label")}}
- [Hướng dẫn về biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
