---
title: "HTMLAnchorElement: thuộc tính href"
short-title: href
slug: Web/API/HTMLAnchorElement/href
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.href
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`href`** của giao diện {{domxref("HTMLAnchorElement")}} là một {{Glossary("stringifier")}} trả về URL tuyệt đối tương ứng với thuộc tính `href` của phần tử (hoặc một chuỗi rỗng nếu `href` không được đặt). Việc đặt thuộc tính này sẽ cập nhật thuộc tính `href` của phần tử thành giá trị được cung cấp.

## Giá trị

Một chuỗi.

- Nếu thuộc tính `href` vắng mặt, giá trị là một chuỗi rỗng (`""`).
- Nếu thuộc tính `href` có mặt nhưng không phải là URL tương đối hoặc tuyệt đối hợp lệ, giá trị là giá trị của thuộc tính nguyên bản.
- Nếu thuộc tính `href` có mặt và là một URL tương đối hoặc tuyệt đối hợp lệ, giá trị là URL tuyệt đối, được phân giải so với URL cơ sở của tài liệu. Chuỗi rỗng (`""`) được coi là một URL tương đối hợp lệ, phân giải thành URL cơ sở của tài liệu.

## Ví dụ

Một phần tử `<a>` mới tạo không có thuộc tính `href`, nên thuộc tính `href` của nó trả về một chuỗi rỗng.

```js
const anchor = document.createElement("a");
console.log(anchor.href); // ""
```

Nếu thuộc tính được đặt thành một chuỗi rỗng, thuộc tính trả về URL cơ sở của tài liệu vì chuỗi rỗng là một URL tương đối hợp lệ.

```js
anchor.href = "";
console.log(anchor.href); // "https://developer.mozilla.org/en-US/docs/Web/API/HTMLAnchorElement/href"
```

Nếu thuộc tính được đặt thành một URL tương đối, thuộc tính trả về URL tuyệt đối được phân giải so với URL cơ sở của tài liệu.

```js
anchor.href = "../../..";
console.log(anchor.href); // "https://developer.mozilla.org/en-US/docs/"
```

Lưu ý rằng giá trị của thuộc tính vẫn được giữ nguyên như đã đặt, không được phân giải.

```js
console.log(anchor.getAttribute("href")); // "../../.."
```

Nếu thuộc tính được đặt thành một URL tuyệt đối, thuộc tính trả về URL tuyệt đối đó nguyên bản.

```js
anchor.href = "https://example.com/path";
console.log(anchor.href); // "https://example.com/path"
```

Nếu thuộc tính được đặt thành một URL không hợp lệ, thuộc tính trả về giá trị của thuộc tính nguyên bản.

```js
anchor.href = "https://";
console.log(anchor.href); // "https://"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
