---
title: <meta name="referrer">
short-title: referrer
slug: Web/HTML/Reference/Elements/meta/name/referrer
page-type: html-attribute-value
browser-compat: html.elements.meta.name.referrer
sidebar: htmlsidebar
---

Giá trị **`referrer`** cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử {{htmlelement("meta")}} kiểm soát HTTP header {{httpheader("Referer")}} của các yêu cầu được gửi từ tài liệu.
Nếu được chỉ định, bạn xác định referrer bằng cách sử dụng thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) trong phần tử `<meta>` dưới dạng giá trị từ khóa.

Ví dụ, phần tử `<meta>` sau đây gửi {{glossary("origin")}} của tài liệu làm referrer:

```html
<meta name="referrer" content="origin" />
```

> [!WARNING]
> Chèn động `<meta name="referrer">` (bằng {{domxref("Document.write", "document.write()")}} hoặc {{domxref("Node.appendChild", "appendChild()")}}) làm cho hành vi referrer không thể đoán trước.
> Khi một số chính sách mâu thuẫn được xác định, chính sách `no-referrer` sẽ được áp dụng.

## Ghi chú sử dụng

Một phần tử `<meta name="referrer">` có các thuộc tính bổ sung sau:

- [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content)
  - : Đặt referrer tài liệu. Bạn phải xác định thuộc tính này.
    Chấp nhận một trong các giá trị sau:
    - `no-referrer`
      - : Không gửi HTTP header `Referer`.
    - `origin`
      - : Gửi origin của tài liệu.
    - `no-referrer-when-downgrade`
      - : Gửi URL đầy đủ khi đích đến ít nhất cũng an toàn như trang hiện tại (HTTP(S)→HTTPS), nhưng không gửi referrer khi kém an toàn hơn (HTTPS→HTTP). Đây là hành vi mặc định.
    - `origin-when-cross-origin`
      - : Gửi URL đầy đủ (đã loại bỏ tham số) cho các yêu cầu cùng nguồn gốc, nhưng chỉ gửi origin trong các trường hợp khác.
    - `same-origin`
      - : Gửi URL đầy đủ (đã loại bỏ tham số) cho các yêu cầu cùng nguồn gốc. Các yêu cầu khác nguồn gốc sẽ không chứa header referrer.
    - `strict-origin`
      - : Gửi origin khi đích đến ít nhất cũng an toàn như trang hiện tại (HTTP(S)→HTTPS), nhưng không gửi referrer khi kém an toàn hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin`
      - : Gửi URL đầy đủ (đã loại bỏ tham số) cho các yêu cầu cùng nguồn gốc. Gửi origin khi đích đến ít nhất cũng an toàn như trang hiện tại (HTTP(S)→HTTPS). Nếu không, không gửi referrer.
    - `unsafe-URL`
      - : Gửi URL đầy đủ (đã loại bỏ tham số) cho các yêu cầu cùng nguồn gốc hoặc khác nguồn gốc.

## Ví dụ

### Xóa referrer khỏi các yêu cầu

Phần tử `<meta>` sau đây chỉ định rằng tài liệu không nên gửi header `Referer` cùng với các yêu cầu HTTP từ tài liệu:

```html
<meta name="referrer" content="no-referrer" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- HTTP header {{httpheader("Referer")}}
