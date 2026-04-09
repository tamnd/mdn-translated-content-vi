---
title: Using microdata in HTML
short-title: Microdata
slug: Web/HTML/Guides/Microdata
page-type: guide
sidebar: htmlsidebar
---

Microdata là một phần của {{glossary("WHATWG")}} HTML Standard và được sử dụng để lồng metadata vào nội dung hiện có trên các trang web. Các công cụ tìm kiếm và web crawler có thể trích xuất và xử lý microdata từ một trang web và sử dụng nó để cung cấp trải nghiệm duyệt web phong phú hơn cho người dùng. Các công cụ tìm kiếm được hưởng lợi rất nhiều từ việc truy cập trực tiếp vào dữ liệu có cấu trúc này vì nó cho phép các công cụ tìm kiếm hiểu thông tin trên các trang web và cung cấp kết quả phù hợp hơn cho người dùng. Microdata sử dụng từ vựng hỗ trợ để mô tả một item và các cặp tên-giá trị để gán giá trị cho các thuộc tính của nó. Microdata là một nỗ lực cung cấp cách khai báo để chú thích các phần tử HTML bằng các thẻ có thể đọc được bởi máy tính hơn so với các cách tiếp cận tương tự khi sử dụng RDFa và microformats cổ điển.

Ở mức độ cao, microdata bao gồm một nhóm các cặp tên-giá trị. Các nhóm được gọi là items, và mỗi cặp tên-giá trị là một thuộc tính. Các items và thuộc tính được biểu diễn bởi các phần tử thông thường.

- Để tạo một item, thuộc tính `itemscope` được sử dụng.
- Để thêm một thuộc tính vào một item, thuộc tính `itemprop` được sử dụng trên một trong các phần tử con của item.

## Vocabularies

Google và các công cụ tìm kiếm lớn khác hỗ trợ từ vựng [Schema.org](https://schema.org/) cho dữ liệu có cấu trúc. Từ vựng này xác định một tập hợp tiêu chuẩn các tên loại và tên thuộc tính, ví dụ, [Schema.org Music Event](https://schema.org/MusicEvent) chỉ ra một buổi biểu diễn hòa nhạc, với các thuộc tính [`startDate`](https://schema.org/startDate) và [`location`](https://schema.org/location) để chỉ định các chi tiết chính của buổi hòa nhạc. Trong trường hợp này, [Schema.org Music Event](https://schema.org/MusicEvent) sẽ là URL được sử dụng bởi `itemtype` và `startDate` và location sẽ là các `itemprop` mà [Schema.org Music Event](https://schema.org/MusicEvent) định nghĩa.

> [!NOTE]
> Thêm thông tin về các thuộc tính itemtype có thể được tìm thấy tại <https://schema.org/Thing>.

Các từ vựng microdata cung cấp ngữ nghĩa hoặc ý nghĩa của một _`Item`_. Các nhà phát triển web có thể thiết kế từ vựng tùy chỉnh hoặc sử dụng các từ vựng có sẵn trên web, như từ vựng [schema.org](https://schema.org/) được sử dụng rộng rãi. Một tập hợp các từ vựng đánh dấu thường được sử dụng được cung cấp bởi Schema.org.

Các từ vựng thường được sử dụng:

- Tác phẩm sáng tạo: [CreativeWork](https://schema.org/CreativeWork), [Book](https://schema.org/Book), [Movie](https://schema.org/Movie), [MusicRecording](https://schema.org/MusicRecording), [Recipe](https://schema.org/Recipe), [TVSeries](https://schema.org/TVSeries)
- Đối tượng phi văn bản nhúng: [AudioObject](https://schema.org/AudioObject), [ImageObject](https://schema.org/ImageObject), [VideoObject](https://schema.org/VideoObject)
- [`Event`](https://schema.org/Event)
- [Các loại y tế và sức khỏe](https://schema.org/docs/meddocs.html): Ghi chú về các loại y tế và sức khỏe thuộc [MedicalEntity](https://schema.org/MedicalEntity)
- [`Organization`](https://schema.org/Organization)
- [`Person`](https://schema.org/Person)
- [`Place`](https://schema.org/Place), [LocalBusiness](https://schema.org/LocalBusiness), [Restaurant](https://schema.org/Restaurant)
- [`Product`](https://schema.org/Product), [Offer](https://schema.org/Offer), [AggregateOffer](https://schema.org/AggregateOffer)
- [`Review`](https://schema.org/Review), [AggregateRating](https://schema.org/AggregateRating)
- [`Action`](https://schema.org/Action)
- [`Thing`](https://schema.org/Thing)
- [`Intangible`](https://schema.org/Intangible)

Các nhà khai thác công cụ tìm kiếm lớn như Google, Microsoft và Yahoo! dựa vào từ vựng [schema.org](https://schema.org/) để cải thiện kết quả tìm kiếm. Đối với một số mục đích, một từ vựng ad hoc là đủ. Đối với những mục đích khác, cần thiết kế một từ vựng. Khi có thể, các tác giả được khuyến khích sử dụng lại các từ vựng hiện có, vì điều này giúp việc tái sử dụng nội dung dễ dàng hơn.

## Localization

Trong một số trường hợp, các công cụ tìm kiếm bao gồm các khu vực cụ thể có thể cung cấp các phần mở rộng microdata cụ thể theo địa phương. Ví dụ, [Yandex](https://yandex.com/), một công cụ tìm kiếm lớn ở Nga, hỗ trợ microformats như `hCard` (thông tin liên hệ công ty), `hRecipe` (công thức nấu ăn), `hReview` (đánh giá thị trường) và `hProduct` (dữ liệu sản phẩm) và cung cấp định dạng riêng của mình cho việc định nghĩa các thuật ngữ và bài viết bách khoa. Phần mở rộng này được thực hiện để giải quyết các vấn đề phiên dịch giữa bảng chữ cái Cyrillic và Latin. Do việc triển khai các tham số đánh dấu bổ sung của từ vựng Schema, việc lập chỉ mục thông tin trong các trang web bằng tiếng Nga đã trở nên thành công hơn đáng kể.

## Thuộc tính toàn cục

[`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid) – Định danh toàn cục duy nhất của một item.

[`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) – Được sử dụng để thêm thuộc tính vào một item. Mỗi phần tử HTML có thể có một thuộc tính `itemprop` được chỉ định, trong đó một `itemprop` bao gồm một cặp tên và giá trị.

[`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref) – Các thuộc tính không phải là phần tử con của một phần tử có thuộc tính `itemscope` có thể được liên kết với item bằng cách sử dụng **itemref**. `itemref` cung cấp danh sách các id phần tử (không phải `itemid`) với các thuộc tính bổ sung ở nơi khác trong tài liệu.

[`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) – Thuộc tính `itemscope` (thường) hoạt động cùng với [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype) để chỉ định rằng HTML chứa trong một khối là về một item cụ thể. `itemscope` tạo ra _`Item`_ và xác định phạm vi của itemtype liên quan. Thuộc tính `itemtype` là URL hợp lệ của một từ vựng (như [schema.org](https://schema.org/)) mô tả item và ngữ cảnh thuộc tính của nó.

[`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype) – Chỉ định URL của từ vựng sẽ được sử dụng để định nghĩa `itemprop` (thuộc tính item) trong cấu trúc dữ liệu. Thuộc tính [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) được sử dụng để đặt phạm vi nơi trong cấu trúc dữ liệu từ vựng được đặt bởi `itemtype` sẽ hoạt động.

## Ví dụ

### HTML

```html
<div itemscope itemtype="https://schema.org/SoftwareApplication">
  <span itemprop="name">Angry Birds</span> - REQUIRES
  <span itemprop="operatingSystem">ANDROID</span><br />
  <link
    itemprop="applicationCategory"
    href="https://schema.org/SoftwareApplication" />

  <div
    itemprop="aggregateRating"
    itemscope
    itemtype="https://schema.org/AggregateRating">
    RATING:
    <span itemprop="ratingValue">4.6</span> (
    <span itemprop="ratingCount">8864</span> ratings )
  </div>

  <div itemprop="offers" itemscope itemtype="https://schema.org/Offer">
    Price: $<span itemprop="price">1.00</span>
    <meta itemprop="priceCurrency" content="USD" />
  </div>
</div>
```

### Structured data

<table class="standard-table">
  <tbody>
    <tr>
      <td rowspan="4">itemscope</td>
      <td>itemtype</td>
      <td colspan="2">
        SoftwareApplication (https://schema.org/SoftwareApplication)
      </td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>name</td>
      <td>Angry Birds</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>operatingSystem</td>
      <td>ANDROID</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>applicationCategory</td>
      <td>SoftwareApplication (https://schema.org/SoftwareApplication)</td>
    </tr>
    <tr>
      <td rowspan="3">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td colspan="2">aggregateRating [AggregateRating]</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>ratingValue</td>
      <td>4.6</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>ratingCount</td>
      <td>8864</td>
    </tr>
    <tr>
      <td rowspan="3">itemscope</td>
      <td>itemprop[itemtype]</td>
      <td colspan="2">offers [Offer]</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>price</td>
      <td>1.00</td>
    </tr>
    <tr>
      <td>itemprop</td>
      <td>priceCurrency</td>
      <td>USD</td>
    </tr>
  </tbody>
</table>

### Kết quả

{{ EmbedLiveSample('HTML', '', '100') }}

> [!NOTE]
> Một công cụ tiện dụng để trích xuất và xác minh cấu trúc microdata từ HTML là [Schema Markup Validator](https://validator.schema.org/). Hãy thử nó trên HTML được hiển thị ở trên.

## Xem thêm

- [Thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
