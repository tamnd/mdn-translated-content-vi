---
title: HTML itemref global attribute
short-title: itemref
slug: Web/HTML/Reference/Global_attributes/itemref
page-type: html-attribute
spec-urls: https://html.spec.whatwg.org/multipage/microdata.html#attr-itemref
sidebar: htmlsidebar
---

Các thuộc tính không phải là con cháu của phần tử có thuộc tính [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) có thể được liên kết với một mục bằng cách sử dụng [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`itemref`**.

`itemref` cung cấp danh sách các ID phần tử (không phải `itemid`) ở nơi khác trong tài liệu, với các thuộc tính bổ sung

Thuộc tính `itemref` chỉ có thể được chỉ định trên các phần tử có thuộc tính `itemscope` được chỉ định.

> [!NOTE]
> Thuộc tính `itemref` không phải là một phần của mô hình dữ liệu microdata. Nó chỉ là một cấu trúc cú pháp để hỗ trợ các tác giả thêm chú thích vào các trang nơi dữ liệu cần được chú thích không tuân theo cấu trúc cây tiện lợi. Ví dụ, nó cho phép các tác giả đánh dấu dữ liệu trong bảng sao cho mỗi cột xác định một mục riêng biệt trong khi giữ các thuộc tính trong các ô.

## Ví dụ

### Biểu diễn dữ liệu có cấu trúc cho một ban nhạc

Ví dụ này sử dụng các thuộc tính microdata để biểu diễn dữ liệu có cấu trúc sau (ở định dạng [JSON-LD](https://json-ld.org/)):

```json
{
  "@id": "amanda",
  "name": "Amanda",
  "band": {
    "@id": "b",
    "name": "Jazz Band",
    "size": 12
  }
}
```

#### HTML

```html
<div itemscope id="amanda" itemref="a b"></div>
<p id="a">Name: <span itemprop="name">Amanda</span></p>
<div id="b" itemprop="band" itemscope itemref="c"></div>
<div id="c">
  <p>Band: <span itemprop="name">Jazz Band</span></p>
  <p>Size: <span itemprop="size">12</span> players</p>
</div>
```

#### Kết quả

{{EmbedLiveSample('Representing structured data for a band')}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Các thuộc tính toàn cục khác](/en-US/docs/Web/HTML/Reference/Global_attributes)
- Các thuộc tính toàn cục liên quan đến microdata khác:
  - [`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid)
  - [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop)
  - [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope)
  - [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype)
