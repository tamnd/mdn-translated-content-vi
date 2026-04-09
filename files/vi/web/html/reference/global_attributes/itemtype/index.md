---
title: HTML itemtype global attribute
short-title: itemtype
slug: Web/HTML/Reference/Global_attributes/itemtype
page-type: html-attribute
spec-urls: https://html.spec.whatwg.org/multipage/microdata.html#attr-itemtype
sidebar: htmlsidebar
---

[Thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`itemtype`** chỉ định URL của từ vựng sẽ được dùng để định nghĩa `itemprop` (các thuộc tính mục) trong cấu trúc dữ liệu.

[`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) được dùng để đặt phạm vi nơi trong cấu trúc dữ liệu mà từ vựng được đặt bởi `itemtype` sẽ hoạt động.

Google và các công cụ tìm kiếm lớn khác hỗ trợ từ vựng [schema.org](https://schema.org/) cho dữ liệu có cấu trúc. Từ vựng này định nghĩa một tập hợp tiêu chuẩn các tên loại và tên thuộc tính. Ví dụ, `MusicEvent` chỉ ra một buổi biểu diễn hòa nhạc, với các thuộc tính [`startDate`](https://schema.org/startDate) và [`location`](https://schema.org/location) chỉ định các chi tiết chính của buổi hòa nhạc. Trong trường hợp này, [`MusicEvent`](https://schema.org/MusicEvent) sẽ là URL được sử dụng bởi `itemtype`, với `startDate` và location là các `itemprop` mà [`MusicEvent`](https://schema.org/MusicEvent) định nghĩa.

> [!NOTE]
> Tìm hiểu thêm về thuộc tính `itemtype` tại <https://schema.org/Thing>

- Thuộc tính **itemtype** phải có giá trị là tập hợp không có thứ tự của các token duy nhất phân biệt chữ hoa chữ thường, mỗi token là URL hợp lệ và tuyệt đối, và tất cả được định nghĩa để sử dụng cùng một từ vựng. Giá trị của thuộc tính phải có ít nhất một token.
- Các loại mục phải tất cả là các loại được định nghĩa trong các đặc tả áp dụng (chẳng hạn như [schema.org](https://schema.org/)), và phải tất cả được định nghĩa để sử dụng cùng một từ vựng.
- Thuộc tính itemtype chỉ có thể được chỉ định trên các phần tử có thuộc tính itemscope được chỉ định.
- Thuộc tính itemid chỉ có thể được chỉ định trên các phần tử có cả thuộc tính itemscope và itemtype được chỉ định. Chúng chỉ có thể được chỉ định trên các phần tử có thuộc tính itemscope, thuộc tính itemtype của phần tử đó chỉ định một từ vựng không hỗ trợ định danh toàn cục cho các mục, như được định nghĩa bởi đặc tả của từ vựng đó.
- Ý nghĩa chính xác của định danh toàn cục được xác định bởi đặc tả của từ vựng. Đặc tả đó xác định liệu có thể tồn tại nhiều mục có cùng định danh toàn cục (dù trên cùng trang hay trên các trang khác nhau) hay không, và các quy tắc xử lý cho từ vựng đó là gì, liên quan đến việc xử lý trường hợp nhiều mục có cùng ID.

## Ví dụ

### Biểu diễn dữ liệu có cấu trúc cho sản phẩm

Ví dụ này sử dụng các thuộc tính microdata để biểu diễn dữ liệu có cấu trúc cho sản phẩm, như sau:

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="7">itemscope</td>
      <td>itemtype</td>
      <td colspan="2">Product (https://schema.org/Product)</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Executive Anvil</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>image</td>
      <td>
        https://pixabay.com/static/uploads/photo/2015/09/05/18/15/suitcase-924605_960_720.png
      </td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>description</td>
      <td>
        Sleeker than ACME's Classic Anvil, the Executive Anvil is perfect for
        the business traveler looking for something to drop from a height.
      </td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>mpn</td>
      <td>925872</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>brand [Thing]</td>
      <td></td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>ACME</td>
    </tr>
    <tr>
      <td rowspan="9">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td>aggregateRating[AggregateRating]</td>
      <td></td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>ratingValue</td>
      <td>4.4</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>reviewCount</td>
      <td>89</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>offers [Offer]</td>
      <td>https://schema.org/Offer</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>priceCurrency</td>
      <td>USD</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>price</td>
      <td>119.99</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>priceValidUntil</td>
      <td>2020-11-05</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>itemCondition</td>
      <td>https://schema.org/UsedCondition</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>availability</td>
      <td>https://schema.org/InStock</td>
    </tr>
    <tr>
      <td rowspan="2">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td>seller [Organization]</td>
      <td>https://schema.org/Organization</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Executive Objects</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Một công cụ hữu ích để trích xuất cấu trúc microdata từ HTML là [Structured Data Testing Tool](https://developers.google.com/search/docs/appearance/structured-data) của Google. Hãy thử nó trên HTML được hiển thị ở đây.

#### HTML

```html
<div itemscope itemtype="https://schema.org/Product">
  <span itemprop="brand">ACME<br /></span>
  <span itemprop="name">Executive Anvil<br /></span>
  <img
    itemprop="image"
    src="https://pixabay.com/static/uploads/photo/2015/09/05/18/15/suitcase-924605_960_720.png"
    width="50"
    height="50"
    alt="Executive Anvil logo" /><br />

  <span itemprop="description">
    Sleeker than ACME's Classic Anvil, the Executive Anvil is perfect for the
    business traveler looking for something to drop from a height.
    <br />
  </span>

  Product #: <span itemprop="mpn">925872<br /></span>
  <span
    itemprop="aggregateRating"
    itemscope
    itemtype="https://schema.org/AggregateRating">
    Rating: <span itemprop="ratingValue">4.4</span> stars, based on
    <span itemprop="reviewCount">89 </span> reviews
  </span>
  <p>
    <span itemprop="offers" itemscope itemtype="https://schema.org/Offer">
      Regular price: $179.99<br />
      <meta itemprop="priceCurrency" content="USD" />
      <span itemprop="price">Sale price: $119.99<br /></span>
      (Sale ends
      <time itemprop="priceValidUntil" datetime="2020-11-05">5 November!</time>)
      <br />
      Available from:
      <span
        itemprop="seller"
        itemscope
        itemtype="https://schema.org/Organization">
        <span itemprop="name">Executive Objects<br /></span>
      </span>
      Condition:
      <link
        itemprop="itemCondition"
        href="https://schema.org/UsedCondition" />Previously owned, in excellent
      condition<br />
      <link itemprop="availability" href="https://schema.org/InStock" />In
      stock! Order now!
    </span>
  </p>
</div>
```

#### Kết quả

{{EmbedLiveSample('Representing structured data for a product', '', '400')}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Các thuộc tính toàn cục khác](/en-US/docs/Web/HTML/Reference/Global_attributes)
- Các thuộc tính toàn cục liên quan đến microdata khác:
  - [`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid)
  - [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop)
  - [`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref)
  - [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope)
