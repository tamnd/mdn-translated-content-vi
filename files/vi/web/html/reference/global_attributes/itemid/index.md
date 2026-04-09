---
title: HTML itemid global attribute
short-title: itemid
slug: Web/HTML/Reference/Global_attributes/itemid
page-type: html-attribute
spec-urls: https://html.spec.whatwg.org/multipage/microdata.html#attr-itemid
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`itemid`** cung cấp microdata dưới dạng định danh toàn cục duy nhất của một mục.

Thuộc tính `itemid` chỉ có thể được chỉ định cho một phần tử có cả thuộc tính [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) và [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype). Ngoài ra, `itemid` chỉ có thể được chỉ định trên các phần tử có thuộc tính `itemscope` mà `itemtype` tương ứng tham chiếu đến hoặc định nghĩa một từ vựng hỗ trợ định danh toàn cục.

Ý nghĩa chính xác của định danh toàn cục của `itemtype` được cung cấp bởi định nghĩa của định danh đó trong từ vựng được chỉ định. Từ vựng xác định liệu có thể tồn tại nhiều mục có cùng định danh toàn cục hay không và nếu có thì cách xử lý các mục có cùng định danh như thế nào.

> [!NOTE]
> Định nghĩa {{glossary("WHATWG")}} chỉ định rằng `itemid` phải là {{glossary("URL")}}. Tuy nhiên, ví dụ sau minh họa đúng rằng {{glossary("URN")}} cũng có thể được sử dụng. Sự không nhất quán này có thể phản ánh tính chưa hoàn chỉnh của đặc tả Microdata.

## Ví dụ

### Biểu diễn dữ liệu có cấu trúc cho một cuốn sách

Ví dụ này sử dụng các thuộc tính microdata để biểu diễn dữ liệu có cấu trúc sau:

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="4">itemscope</td>
      <td>itemtype: itemid</td>
      <td colspan="2">https://schema.org/Book: urn:isbn:0-374-22848-5</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>title</td>
      <td>Owls of the Eastern Ice</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>author</td>
      <td>Jonathan C Slaght</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>datePublished</td>
      <td>2020-08-04</td>
    </tr>
  </tbody>
</table>

#### HTML

```html
<dl
  itemscope
  itemtype="https://schema.org/Book"
  itemid="urn:isbn:0-374-22848-5<">
  <dt>Title</dt>
  <dd itemprop="title">Owls of the Eastern Ice</dd>
  <dt>Author</dt>
  <dd itemprop="author">Jonathan C Slaght</dd>
  <dt>Publication date</dt>
  <dd>
    <time itemprop="datePublished" datetime="2020-08-04">August 4 2020</time>
  </dd>
</dl>
```

#### Kết quả

{{EmbedLiveSample('Representing structured data for a book')}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- Các thuộc tính toàn cục liên quan đến microdata khác:
  - [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop)
  - [`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref)
  - [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope)
  - [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype)
