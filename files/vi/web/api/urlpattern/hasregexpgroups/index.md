---
title: "URLPattern: hasRegExpGroups property"
short-title: hasRegExpGroups
slug: Web/API/URLPattern/hasRegExpGroups
page-type: web-api-instance-property
browser-compat: api.URLPattern.hasRegExpGroups
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`hasRegExpGroups`** của giao diện {{domxref("URLPattern")}} là một giá trị boolean cho biết liệu bất kỳ thành phần nào của `URLPattern` có chứa [nhóm bắt giữ của biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) hay không.

Bạn có thể dùng thuộc tính `hasRegExpGroups` để kiểm tra xem một đối tượng `URLPattern` có thể sử dụng với một số API nền tảng web không cho phép nhóm bắt giữ của biểu thức chính quy hay không. Ví dụ:

- Chỉ thị `match` trong header HTTP {{HTTPHeader("Use-As-Dictionary")}} không cho phép nhóm bắt giữ của biểu thức chính quy, cũng như
- điều kiện `urlPattern` khi thêm các route tĩnh bằng phương thức {{domxref("InstallEvent.addRoutes()")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

### Dùng `hasRegExpGroups`

Trong ví dụ sau, một đối tượng {{domxref("URLPattern")}} được dùng với một dấu phân tách nhóm chứa các nhóm bắt giữ có tên là "id" và "title". Thuộc tính `hasRegExpGroups` trả về `true` trong trường hợp này.

```js
const pattern = new URLPattern({ pathname: "/blog/:id(\\d+){-:title}?" });
console.log(pattern.hasRegExpGroups); // true
const result = pattern.exec({ pathname: "/blog/123-some-article" });
console.log(result.pathname.groups); // {id: '123', title: 'some-article'}
```

Nó cũng hoạt động với các nhóm bắt giữ không tên.

```js
const pattern = new URLPattern({ pathname: "/blog/(\\d+)" });
console.log(pattern.hasRegExpGroups); // true
const result = pattern.exec({ pathname: "/blog/123" });
console.log(result.pathname.groups); // {0: '123'}
```

Với các nhóm không bắt giữ khác, chẳng hạn khi dùng ký tự đại diện (`*`), `hasRegExpGroups` sẽ trả về `false`.

```js
const pattern = new URLPattern({ pathname: "/blog/*" });
console.log(pattern.hasRegExpGroups); // false
const result = pattern.exec({ pathname: "/blog/123" });
console.log(result.pathname.groups); // {0: '123'}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
