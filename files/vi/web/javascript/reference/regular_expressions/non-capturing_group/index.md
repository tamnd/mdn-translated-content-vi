---
title: "Non-capturing group: (?:...)"
slug: Web/JavaScript/Reference/Regular_expressions/Non-capturing_group
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.non_capturing_group
sidebar: jssidebar
---

Một **non-capturing group** nhóm một subpattern, cho phép bạn áp dụng một [quantifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) cho toàn bộ nhóm hoặc sử dụng [disjunctions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction) bên trong nó. Nó hoạt động như [toán tử nhóm](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) trong các biểu thức JavaScript, và không giống như [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group), nó không ghi nhớ văn bản đã khớp, cho phép hiệu suất tốt hơn và tránh nhầm lẫn khi pattern cũng chứa các capturing groups hữu ích.

## Cú pháp

```regex
(?:pattern)
```

### Tham số

- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).

## Ví dụ

### Nhóm một subpattern và áp dụng quantifier

Trong ví dụ sau, chúng ta kiểm tra xem một đường dẫn file có kết thúc bằng `styles.css` hoặc `styles.[a hex hash].css` không. Vì toàn bộ phần `\.[\da-f]+` là tùy chọn, để áp dụng quantifier `?` cho nó, chúng ta cần nhóm nó thành một atom mới. Sử dụng non-capturing group cải thiện hiệu suất bằng cách không tạo ra thông tin khớp thêm mà chúng ta không cần.

```js
function isStylesheet(path) {
  return /styles(?:\.[\da-f]+)?\.css$/.test(path);
}

isStylesheet("styles.css"); // true
isStylesheet("styles.1234.css"); // true
isStylesheet("styles.cafe.css"); // true
isStylesheet("styles.1234.min.css"); // false
```

### Nhóm một disjunction

Một disjunction có độ ưu tiên thấp nhất trong một regular expression. Nếu bạn muốn sử dụng một disjunction như một phần của pattern lớn hơn, bạn phải nhóm nó. Bạn được khuyến khích sử dụng non-capturing group trừ khi bạn dựa vào văn bản đã khớp của disjunction. Ví dụ sau khớp các phần mở rộng file, sử dụng cùng mã như bài viết [input boundary assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion#matching_file_extensions):

```js
function isImage(filename) {
  return /\.(?:png|jpe?g|webp|avif|gif)$/i.test(filename);
}

isImage("image.png"); // true
isImage("image.jpg"); // true
isImage("image.pdf"); // false
```

### Tránh nguy cơ khi tái cấu trúc

Các capturing groups được truy cập theo vị trí của chúng trong pattern. Nếu bạn thêm hoặc xóa một capturing group, bạn cũng phải cập nhật vị trí của các capturing groups khác, nếu bạn đang truy cập chúng qua kết quả khớp hoặc [backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference). Đây có thể là nguồn gốc của các lỗi, đặc biệt nếu hầu hết các nhóm chỉ vì mục đích cú pháp (để áp dụng quantifiers hoặc nhóm disjunctions). Sử dụng non-capturing groups tránh vấn đề này, và cho phép các chỉ số của các capturing groups thực sự dễ dàng theo dõi.

Ví dụ, giả sử chúng ta có một hàm khớp pattern `title='xxx'` trong một chuỗi (ví dụ lấy từ [capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group#pairing_quotes)). Để đảm bảo các dấu ngoặc kép khớp nhau, chúng ta sử dụng backreference để tham chiếu đến dấu ngoặc kép đầu tiên.

```js
function parseTitle(metastring) {
  return metastring.match(/title=(["'])(.*?)\1/)[2];
}

parseTitle('title="foo"'); // 'foo'
```

Nếu sau này chúng ta quyết định thêm `name='xxx'` làm bí danh cho `title=`, chúng ta sẽ cần nhóm disjunction trong một nhóm khác:

```js example-bad
function parseTitle(metastring) {
  // Oops — the backreference and index access are now off by one!
  return metastring.match(/(title|name)=(["'])(.*?)\1/)[2];
}

parseTitle('name="foo"'); // Cannot read properties of null (reading '2')
// Because \1 now refers to the "name" string, which isn't found at the end.
```

Thay vì tìm tất cả các nơi chúng ta đang tham chiếu đến các chỉ số của capturing groups và cập nhật chúng từng cái một, tốt hơn là tránh sử dụng capturing group:

```js example-good
function parseTitle(metastring) {
  // Do not capture the title|name disjunction
  // because we don't use its value
  return metastring.match(/(?:title|name)=(["'])(.*?)\1/)[2];
}

parseTitle('name="foo"'); // 'foo'
```

[Named capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) là một cách khác để tránh nguy cơ khi tái cấu trúc. Nó cho phép các capturing groups được truy cập bằng tên tùy chỉnh, không bị ảnh hưởng khi các capturing groups khác được thêm hoặc xóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
