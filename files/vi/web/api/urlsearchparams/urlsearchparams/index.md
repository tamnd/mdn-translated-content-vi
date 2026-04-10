---
title: "URLSearchParams: constructor URLSearchParams()"
short-title: URLSearchParams()
slug: Web/API/URLSearchParams/URLSearchParams
page-type: web-api-constructor
browser-compat: api.URLSearchParams.URLSearchParams
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Constructor **`URLSearchParams()`** tạo và trả về một đối tượng {{domxref("URLSearchParams")}} mới.

## Cú pháp

```js-nolint
new URLSearchParams()
new URLSearchParams(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một trong các dạng sau:
    - Một chuỗi, sẽ được phân tích từ định dạng `application/x-www-form-urlencoded`. Ký tự `'?'` đứng đầu sẽ bị bỏ qua. Đây là dạng duy nhất giải mã [mã hóa phần trăm](/en-US/docs/Glossary/Percent-encoding), và giải mã `+` thành U+0020 SPACE.
    - Một chuỗi literal gồm các cặp tên-giá trị, hoặc bất kỳ đối tượng nào - chẳng hạn như đối tượng {{domxref("FormData")}} - có một [iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators#iterators) tạo ra một chuỗi các cặp chuỗi. Lưu ý rằng các mục {{domxref("File")}} sẽ được tuần tự hóa thành `[object File]` thay vì tên tệp của chúng (như trong một biểu mẫu `application/x-www-form-urlencoded`).
    - Một record gồm các khóa chuỗi và giá trị chuỗi. Lưu ý rằng lồng nhau không được hỗ trợ.

### Giá trị trả về

Một thể hiện đối tượng {{domxref("URLSearchParams")}}.

## Ví dụ

Ví dụ sau cho thấy cách tạo một đối tượng {{domxref("URLSearchParams")}} từ nhiều đầu vào khác nhau.

```js
// Lấy params qua url.search, truyền vào constructor
const url = new URL("https://example.com?foo=1&bar=2");
const params1 = new URLSearchParams(url.search);

// Lấy trực tiếp đối tượng URLSearchParams từ một đối tượng URL
const params1a = url.searchParams;

// Truyền vào một chuỗi literal
const params2 = new URLSearchParams("foo=1&bar=2");
const params2a = new URLSearchParams("?foo=1&bar=2");

// Truyền vào một chuỗi cặp
const params3 = new URLSearchParams([
  ["foo", "1"],
  ["bar", "2"],
]);

// Truyền vào một record
const params4 = new URLSearchParams({ foo: "1", bar: "2" });
```

Ví dụ này cho thấy cách dựng một URL mới với một đối tượng tham số truy vấn từ một URL hiện có có tham số truy vấn.

```js
const url = new URL("https://example.com/?a=hello&b=world");

console.log(url.href);
// https://example.com/?a=hello&b=world

console.log(url.origin);
// https://example.com

const addParams = {
  c: "a",
  d: 2,
  e: false,
};

const newParams = new URLSearchParams([
  ...Array.from(url.searchParams.entries()), // [["a","hello"],["b","world"]]
  ...Object.entries(addParams), // [["c","a"],["d",2],["e",false]]
]).toString();
console.log(newParams);
// a=hello&b=world&c=a&d=2&e=false

const newURL = new URL(`${url.origin}${url.pathname}?${newParams}`);

console.log(newURL.href);
// https://example.com/?a=hello&b=world&c=a&d=2&e=false

// Đây là dạng hàm nhận (URL, Record<string, string>)
const addSearchParams = (url, params = {}) =>
  new URL(
    `${url.origin}${url.pathname}?${new URLSearchParams([
      ...Array.from(url.searchParams.entries()),
      ...Object.entries(params),
    ])}`,
  );
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
