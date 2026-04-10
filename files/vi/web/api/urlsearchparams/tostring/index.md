---
title: "URLSearchParams: phương thức toString()"
short-title: toString()
slug: Web/API/URLSearchParams/toString
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.toString
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("URLSearchParams")}} trả về một chuỗi truy vấn phù hợp để sử dụng trong một URL.

> [!NOTE]
> Phương thức này trả về chuỗi truy vấn không có dấu chấm hỏi. Điều này khác với [`Location.search`](/en-US/docs/Web/API/Location/search), [`HTMLAnchorElement.search`](/en-US/docs/Web/API/HTMLAnchorElement/search), và [`URL.search`](/en-US/docs/Web/API/URL/search), tất cả đều bao gồm dấu chấm hỏi.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi, không có dấu chấm hỏi. Trả về chuỗi rỗng nếu chưa có tham số truy vấn nào được đặt. Các ký tự trong [tập hợp mã hóa phần trăm `application/x-www-form-urlencoded`](https://url.spec.whatwg.org/#application-x-www-form-urlencoded-percent-encode-set) (bao gồm tất cả các điểm mã trừ ký tự chữ-số ASCII, `*`, `-`, `.`, và `_`) được [mã hóa phần trăm](/en-US/docs/Glossary/Percent-encoding), và U+0020 SPACE được mã hóa thành `+`.

## Ví dụ

```js
const url = new URL("https://example.com?foo=1&bar=2");
const params = new URLSearchParams(url.search);

// Thêm một tham số foo thứ hai.
params.append("foo", 4);
console.log(params.toString()); // In ra 'foo=1&bar=2&foo=4'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}.
- [Google Developers: Thao tác URL dễ dàng với URLSearchParams](https://developer.chrome.com/blog/urlsearchparams/)
