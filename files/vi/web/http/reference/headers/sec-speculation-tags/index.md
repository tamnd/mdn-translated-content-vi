---
title: Sec-Speculation-Tags header
short-title: Sec-Speculation-Tags
slug: Web/HTTP/Reference/Headers/Sec-Speculation-Tags
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-Speculation-Tags
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-Speculation-Tags`** {{Glossary("request header")}} chứa một hoặc nhiều giá trị `tag` từ [quy tắc suy đoán](/en-US/docs/Web/API/Speculation_Rules_API) đã dẫn đến suy đoán. Điều này cho phép máy chủ xác định quy tắc nào gây ra suy đoán và có thể chặn chúng.

Ví dụ: CDN có thể tự động chèn các quy tắc suy đoán, nhưng chặn các suy đoán cho tài nguyên không được lưu trong bộ nhớ đệm của CDN để tránh hậu quả không mong muốn. Tiêu đề `Sec-Speculation-Tags` cho phép CDN phân biệt giữa các quy tắc nó đã chèn (cần bị chặn trong trường hợp này) và các quy tắc suy đoán được thêm bởi chủ sở hữu trang web (không nên bị chặn).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Speculation-Tags: <tag-list>
```

## Chỉ thị

- `<tag-list>`
  - : Danh sách các tag phân cách bằng dấu phẩy cho biết các quy tắc [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) có thể đã khởi tạo yêu cầu này. Xem [Biểu diễn JSON của quy tắc suy đoán](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules#speculation_rules_json_representation) để tham khảo cú pháp.

## Ví dụ

### Suy đoán từ quy tắc không có tag rõ ràng

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"]
      }
    ]
  }
</script>
```

Nếu suy đoán xảy ra do quy tắc suy đoán không có tag, thì `null` được gửi trong tiêu đề `Sec-Speculation-Tags`.

```http
Sec-Speculation-Tags: null
```

### Suy đoán từ quy tắc có tag

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "tag": "my-rule",
        "urls": ["next.html", "next2.html"]
      }
    ]
  }
</script>
```

Nếu suy đoán xảy ra do quy tắc suy đoán có tag, tên tag được gửi trong tiêu đề `Sec-Speculation-Tags`.

```http
Sec-Speculation-Tags: "my-rule"
```

### Suy đoán từ quy tắc có nhiều tag

`tag` có thể được đặt ở nhiều cấp:

```html
<script type="speculationrules">
  {
    "tag": "my-ruleset",
    "prefetch": [
      {
        "tag": "my-rule",
        "urls": ["next.html", "next2.html"]
      }
    ]
  }
</script>
```

Tất cả các tag khớp được gửi trong tiêu đề `Sec-Speculation-Tags`, do đó trong trường hợp này, cả `"my-ruleset"` và `"my-rule"` sẽ được gửi:

```http
Sec-Speculation-Tags: "my-ruleset", "my-rule"
```

### Suy đoán từ nhiều quy tắc

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "tag": "my-rule",
        "urls": ["next.html", "next2.html"],
        "eagerness": "moderate"
      }
    ]
  }
</script>
<script type="speculationrules">
  {
    "prefetch": [
      {
        "tag": "cdn-rule",
        "urls": ["next.html", "next.html"],
        "eagerness": "conservative"
      }
    ]
  }
</script>
```

Trong ví dụ này, nếu suy đoán được khởi tạo bởi người dùng di chuột qua liên kết trong 200 milliseconds (`"eagerness": "moderate"`), thì chỉ tag `my-rule` sẽ được gửi trong tiêu đề:

```http
Sec-Speculation-Tags: "my-rule"
```

Tuy nhiên, nếu liên kết được nhấp ngay lập tức, không chờ 200 milliseconds di chuột, thì cả hai quy tắc đều sẽ kích hoạt suy đoán, do đó cả hai tag sẽ được bao gồm trong tiêu đề:

```http
Sec-Speculation-Tags: "my-rule", "cdn-rule"
```

### Suy đoán từ nhiều quy tắc có và không có tag

```html
<script type="speculationrules">
  {
    "prefetch": [
      {
        "urls": ["next.html", "next2.html"],
        "eagerness": "moderate"
      }
    ]
  }
</script>
<script type="speculationrules">
  {
    "prefetch": [
      {
        "tag": "cdn-rule",
        "urls": ["next.html", "next.html"],
        "eagerness": "conservative"
      }
    ]
  }
</script>
```

Tương tự như ví dụ trước, nếu liên kết được nhấp ngay lập tức không chờ 200 milliseconds di chuột, cả hai quy tắc đều sẽ kích hoạt suy đoán, do đó cả hai tag sẽ được bao gồm trong tiêu đề. Tuy nhiên, vì quy tắc đầu tiên không bao gồm trường `tag`, nó được đại diện trong tiêu đề với giá trị `null`:

```http
Sec-Speculation-Tags: null, "cdn-rule"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
- [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules)
