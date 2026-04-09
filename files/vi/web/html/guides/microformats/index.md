---
title: Using microformats in HTML
short-title: Microformats
slug: Web/HTML/Guides/Microformats
page-type: guide
sidebar: htmlsidebar
---

[_Microformats_](https://microformats.org/wiki/Main_Page) là các tiêu chuẩn được sử dụng để nhúng ngữ nghĩa và dữ liệu có cấu trúc vào HTML, và cung cấp một API để sử dụng bởi các ứng dụng web xã hội, công cụ tìm kiếm, bộ tổng hợp và các công cụ khác. Các mẫu HTML tối thiểu này được sử dụng để đánh dấu các thực thể từ thông tin cơ bản đến thông tin theo lĩnh vực cụ thể, như người, tổ chức, sự kiện và địa điểm.

- Để tạo một đối tượng microformats, tên lớp `h-*` được sử dụng trong thuộc tính class.
- Để thêm thuộc tính vào một đối tượng, tên lớp `p-*`, `u-*`, `dt-*`, `e-*` được sử dụng trên một trong các phần tử con của đối tượng.

Microformats sử dụng các từ vựng hỗ trợ để mô tả các đối tượng và các cặp tên-giá trị để gán giá trị cho các thuộc tính của chúng. Các thuộc tính được mang trong các thuộc tính class có thể được thêm vào bất kỳ phần tử HTML nào, trong khi các giá trị dữ liệu sử dụng lại nội dung phần tử HTML và các thuộc tính ngữ nghĩa.

Microformats2 (đôi khi được gọi là mf2) là một bản cập nhật của microformats cung cấp một phương pháp chú thích cú pháp và từ vựng có cấu trúc HTML tốt hơn so với các cách tiếp cận trước đây khi sử dụng RDFa và microdata. Những cách tiếp cận trước đó yêu cầu học các thuộc tính mới.

Có [các thư viện phân tích cú pháp mã nguồn mở cho hầu hết các ngôn ngữ](https://microformats.org/wiki/microformats2#Parsers) cho microformats2.

## Cách microformats hoạt động

Tác giả của một trang web có thể thêm microformats vào HTML của họ. Ví dụ, nếu họ muốn tự nhận diện mình, họ có thể sử dụng [h-card](https://microformats.org/wiki/h-card) như:

### Ví dụ HTML

```html
<a class="h-card" href="https://alice.example.com">Alice Blogger</a>
```

Khi một trình phân tích cú pháp gặp dữ liệu này, nó sẽ biết rằng trang này chứa một "card" mô tả một người hoặc tổ chức có tên `Alice Blogger` với URL `https://alice.example.com/`. Trình phân tích cú pháp làm cho dữ liệu này có sẵn thông qua các API có thể được sử dụng cho các ứng dụng khác nhau. Ví dụ, một ứng dụng có thể quét một trang để tìm h-card và sử dụng nó làm thông tin hồ sơ cho người đã đăng ký một dịch vụ.

Như trong ví dụ này, một số mẫu đánh dấu chỉ yêu cầu một tên lớp microformat root duy nhất, mà các trình phân tích cú pháp sử dụng để tìm một số thuộc tính chung như `name`, `url`, `photo`.

## Các trường hợp sử dụng microformats

Microformats có nhiều trường hợp sử dụng. Đầu tiên, [tiêu chuẩn Webmention](https://webmention.net/draft/) sử dụng microformats để cung cấp một cách các tin nhắn và bình luận có thể được gửi từ trang này sang trang khác. Đặc tả Webmention định nghĩa các thuộc tính cụ thể mà các trang có thể xuất bản và tiêu thụ để tạo ra một cách phong phú và tương tác để xuất bản tin nhắn và bình luận. Microformats cũng có thể được sử dụng với Webmentions để cho phép gửi các phản ứng xã hội như lượt thích, repost và bookmark từ trang này sang trang khác.

Microformats cũng cho phép tổng hợp dễ dàng trên các trang. Một bộ tổng hợp có thể phân tích một trang với microformats đã xuất bản để tìm kiếm thông tin như tiêu đề bài đăng, nội dung bài đăng và tác giả của bài đăng. Bộ tổng hợp này sau đó có thể sử dụng thông tin ngữ nghĩa thu thập được để hiển thị kết quả trên trang của họ. Ví dụ, các bộ tổng hợp tin tức và bảng đăng cộng đồng có thể tạo điều kiện cho các bài nộp và sử dụng microformats để trích xuất nội dung liên quan từ một trang. Hơn nữa, một trang web có thể sử dụng microformats để gửi các yêu cầu được thiết kế đến bên thứ ba để xuất bản nội dung, như các mạng xã hội.

Tất cả các công cụ tìm kiếm lớn đều hỗ trợ đọc và diễn giải microformats. Các công cụ tìm kiếm hưởng lợi rất nhiều từ việc truy cập trực tiếp vào dữ liệu có cấu trúc này vì nó cho phép chúng hiểu thông tin trên các trang web. Với thông tin này, các công cụ tìm kiếm có thể cung cấp kết quả phù hợp hơn cho người dùng. Một số công cụ tìm kiếm có thể hiển thị các đoạn trích đặc biệt như đánh giá sao trên trang kết quả tìm kiếm dựa trên dữ liệu được cung cấp trong microformats.

Ngoài việc có thể đọc được bởi máy tính, microformats được thiết kế để dễ đọc bởi con người. Cách tiếp cận này giúp mọi người dễ dàng hiểu và duy trì dữ liệu microformats.

## Tiền tố microformats

Tất cả microformats bao gồm một root và một tập hợp các thuộc tính. Các thuộc tính đều là tùy chọn và có thể có nhiều giá trị — các ứng dụng cần một giá trị duy nhất có thể sử dụng instance đầu tiên của một thuộc tính. Dữ liệu phân cấp được biểu diễn bằng các microformats lồng nhau, thường là các giá trị thuộc tính chính chúng.

Tất cả các tên lớp microformats sử dụng tiền tố. Tiền tố là **cú pháp độc lập với từ vựng**, được phát triển riêng biệt.

- **"h-\*" cho tên lớp root**, ví dụ, "h-card", "h-entry", "h-feed", và nhiều hơn nữa. Các lớp root cấp cao nhất này thường chỉ ra một loại và từ vựng thuộc tính mong đợi tương ứng. Ví dụ:
  - [h-card](https://microformats.org/wiki/h-card) mô tả một người hoặc tổ chức
  - [h-entry](https://microformats.org/wiki/h-entry) mô tả nội dung trực tuyến theo từng episode hoặc có dấu thời gian như một bài đăng blog
  - [h-feed](https://microformats.org/wiki/h-feed) mô tả một luồng hoặc nguồn cấp dữ liệu bài đăng
  - Bạn có thể tìm thấy nhiều [từ vựng hơn trên wiki microformats2.](https://microformats.org/wiki/microformats2#v2_vocabularies)

- **"p-\*" cho các thuộc tính plain (text)**, ví dụ, "p-name", "p-summary"
  - Phân tích cú pháp văn bản thuần túy chung, văn bản phần tử nói chung. Trên một số phần tử HTML, sử dụng các thuộc tính đặc biệt trước, ví dụ, img/alt, abbr/title.

- **"u-\*" cho các thuộc tính URL**, ví dụ, "u-url", "u-photo", "u-logo"
  - Phân tích cú pháp đặc biệt: các thuộc tính phần tử a/href, img/src, object/data, v.v. ưu tiên hơn nội dung phần tử.

- **"dt-\*" cho các thuộc tính datetime**, ví dụ, "dt-start", "dt-end", "dt-bday"
  - Phân tích cú pháp đặc biệt: thuộc tính datetime của phần tử time, [value-class-pattern](https://microformats.org/wiki/value-class-pattern) và phân tích cú pháp giá trị ngày giờ riêng biệt để dễ đọc.

- **"e-\*" cho các thuộc tính element tree** nơi toàn bộ phân cấp phần tử chứa là giá trị, ví dụ, "e-content". Tiền tố "e-" cũng có thể được nhớ dễ dàng là "element tree", "embedded markup", hoặc "encapsulated markup".

## Một số ví dụ microformats

### h-card

Microformat [h-card](https://microformats.org/wiki/h-card) biểu diễn một người hoặc tổ chức.

Giá trị của mỗi thuộc tính được xác định trong HTML bằng thuộc tính class mà bất kỳ phần tử nào cũng có thể mang

#### Ví dụ h-card

```html
<p class="h-card">
  <img class="u-photo" src="https://example.org/photo.png" alt="" />
  <a class="p-name u-url" href="https://example.org">Joe Bloggs</a>
  <a class="u-email" href="mailto:jbloggs@example.com">jbloggs@example.com</a>,
  <span class="p-street-address">17 Austerstræti</span>
  <span class="p-locality">Reykjavík</span>
  <span class="p-country-name">Iceland</span>
</p>
```

| Thuộc tính             | Mô tả                                                   |
| ---------------------- | ------------------------------------------------------- |
| **`p-name`**           | Tên đầy đủ/định dạng của người hoặc tổ chức.            |
| **`u-email`**          | địa chỉ email                                           |
| **`u-photo`**          | ảnh của người hoặc tổ chức                              |
| **`u-url`**            | trang chủ hoặc URL khác đại diện cho người hoặc tổ chức |
| **`u-uid`**            | định danh duy nhất toàn cầu, tốt nhất là URL chuẩn      |
| **`p-street-address`** | số nhà + tên đường                                      |
| **`p-locality`**       | thành phố/thị xã/làng                                   |
| **`p-country-name`**   | tên quốc gia                                            |

#### Ví dụ h-card lồng nhau

```html
<div class="h-card">
  <a class="p-name u-url" href="https://blog.lizardwrangler.com/">
    Mitchell Baker
  </a>
  (<a class="p-org h-card" href="https://mozilla.org/">Mozilla Foundation</a>)
</div>
```

JSON được phân tích:

```json
{
  "items": [
    {
      "type": ["h-card"],
      "properties": {
        "name": ["Mitchell Baker"],
        "url": ["https://blog.lizardwrangler.com/"],
        "org": [
          {
            "value": "Mozilla Foundation",
            "type": ["h-card"],
            "properties": {
              "name": ["Mozilla Foundation"],
              "url": ["https://mozilla.org/"]
            }
          }
        ]
      }
    }
  ]
}
```

Trong ví dụ này, một h-card được chỉ định cho cả một người và tổ chức mà họ đại diện. Sự liên kết của người với tổ chức được liên kết được chỉ định bằng cách sử dụng thuộc tính p-org.

Lưu ý: h-card lồng nhau có các thuộc tính 'name' và 'url' được suy luận, giống như bất kỳ h-card nào chỉ có root-class-name trên `<a href>`.

### h-entry

Microformat [h-entry](https://microformats.org/wiki/h-entry) biểu diễn nội dung theo từng episode hoặc có dấu thời gian trên web. h-entry thường được sử dụng với nội dung dự định được tổng hợp, ví dụ, bài đăng blog và ghi chú ngắn.

Ví dụ h-entry dưới dạng bài đăng blog:

```html
<article class="h-entry">
  <h1 class="p-name">Microformats are amazing</h1>
  <p>
    Published by
    <a class="p-author h-card" href="https://example.com">W. Developer</a> on
    <time class="dt-published" datetime="2013-06-13 12:00:00">
      13<sup>th</sup> June 2013
    </time>
  </p>

  <p class="p-summary">In which I extoll the virtues of using microformats.</p>

  <div class="e-content">
    <p>Blah blah blah</p>
  </div>
</article>
```

#### Thuộc tính

| Thuộc tính         | Mô tả                                      |
| ------------------ | ------------------------------------------ |
| **`p-name`**       | tên/tiêu đề entry                          |
| **`p-author`**     | người đã viết entry, tùy chọn nhúng h-card |
| **`dt-published`** | thời điểm entry được xuất bản              |
| **`p-summary`**    | tóm tắt ngắn entry                         |
| **`e-content`**    | nội dung đầy đủ của entry                  |

#### Ví dụ h-entry phản hồi được phân tích

```html
<div class="h-entry">
  <p>
    <span class="p-author h-card">
      <a href="https://quickthoughts.jgregorymcverry.com/profile/jgmac1106">
        <img
          class="u-photo"
          alt="Greg McVerry"
          src="https://quickthoughts.jgregorymcverry.com/file/2d6c9cfed7ac8e849f492b5bc7e6a630/thumb.jpg" />
      </a>
      <a
        class="p-name u-url"
        href="https://quickthoughts.jgregorymcverry.com/profile/jgmac1106">
        Greg McVerry
      </a>
    </span>
    Replied to
    <a
      class="u-in-reply-to"
      href="https://developer.mozilla.org/en-US/docs/Web/HTML/Guides/Microformats">
      a post on <strong>developer.mozilla.org</strong>
    </a>
    :
  </p>
  <p class="p-name e-content">
    Hey thanks for making this microformats resource
  </p>
  <p>
    <a href="https://quickthoughts.jgregorymcverry.com/profile/jgmac1106">
      Greg McVerry
    </a>
    published this
    <a
      class="u-url url"
      href="https://quickthoughts.jgregorymcverry.com/2019/05/31/hey-thanks-for-making-this-microformats-resource">
      <time class="dt-published" datetime="2019-05-31T14:19:09+0000">
        31 May 2019
      </time>
    </a>
  </p>
</div>
```

```json
{
  "items": [
    {
      "type": ["h-entry"],
      "properties": {
        "in-reply-to": [
          "https://developer.mozilla.org/en-US/docs/Web/HTML/Guides/Microformats"
        ],
        "name": ["Hey thanks for making this microformats resource"],
        "url": [
          "https://quickthoughts.jgregorymcverry.com/2019/05/31/hey-thanks-for-making-this-microformats-resource"
        ],
        "published": ["2019-05-31T14:19:09+0000"],
        "content": [
          {
            "html": "Hey thanks for making this microformats resource",
            "value": "Hey thanks for making this microformats resource",
            "lang": "en"
          }
        ],
        "author": [
          {
            "type": ["h-card"],
            "properties": {
              "name": ["Greg McVerry"],
              "photo": [
                "https://quickthoughts.jgregorymcverry.com/file/2d6c9cfed7ac8e849f492b5bc7e6a630/thumb.jpg"
              ],
              "url": [
                "https://quickthoughts.jgregorymcverry.com/profile/jgmac1106"
              ]
            },
            "lang": "en",
            "value": "Greg McVerry"
          }
        ]
      },
      "lang": "en"
    }
  ]
}
```

### h-feed

[h-feed](https://microformats.org/wiki/h-feed) là một luồng hoặc nguồn cấp dữ liệu các bài đăng [h-entry](https://microformats.org/wiki/h-entry), như các bài đăng đầy đủ trên trang chủ hoặc các trang lưu trữ, hoặc tóm tắt hoặc các danh sách ngắn khác về bài đăng.

#### Ví dụ h-feed

```html
<div class="h-feed">
  <h1 class="p-name">Microformats Blogs</h1>
  <article class="h-entry">
    <h2 class="p-name">Microformats are amazing</h2>
    <p>
      Published by
      <a class="p-author h-card" href="https://example.com">W. Developer</a> on
      <time class="dt-published" datetime="2013-06-13 12:00:00">
        13<sup>th</sup> June 2013
      </time>
    </p>
    <p class="p-summary">
      In which I extoll the virtues of using microformats.
    </p>
    <div class="e-content"><p>Blah blah blah</p></div>
  </article>
</div>
```

#### Thuộc tính

| Thuộc tính     | Mô tả                                                |
| -------------- | ---------------------------------------------------- |
| **`p-name`**   | tên của nguồn cấp dữ liệu                            |
| **`p-author`** | tác giả của nguồn cấp dữ liệu, tùy chọn nhúng h-card |

#### Phần tử con

<table class="standard-table">
  <tbody>
    <tr>
      <td><strong>Nested h-entry</strong></td>
      <td></td>
    </tr>
    <tr>
      <td>các đối tượng đại diện cho các item của nguồn cấp dữ liệu</td>
      <td></td>
    </tr>
  </tbody>
</table>

### h-event

`h-event` dành cho các sự kiện trên web. h-event thường được sử dụng với cả danh sách sự kiện và các trang sự kiện riêng lẻ.

```html
<div class="h-event">
  <h1 class="p-name">Microformats Meetup</h1>
  <p>
    From
    <time class="dt-start" datetime="2013-06-30 12:00">
      30<sup>th</sup> June 2013, 12:00
    </time>
    to <time class="dt-end" datetime="2013-06-30 18:00">18:00</time> at
    <span class="p-location">Some bar in SF</span>
  </p>
  <p class="p-summary">
    Get together and discuss all things microformats-related.
  </p>
</div>
```

#### Thuộc tính

| Thuộc tính       | Mô tả                                      |
| ---------------- | ------------------------------------------ |
| **`p-name`**     | tên sự kiện (hoặc tiêu đề)                 |
| **`p-summary`**  | tóm tắt ngắn về sự kiện                    |
| **`dt-start`**   | ngày giờ sự kiện bắt đầu                   |
| **`dt-end`**     | ngày giờ sự kiện kết thúc                  |
| **`p-location`** | nơi tổ chức sự kiện, tùy chọn nhúng h-card |

#### Ví dụ h-event được phân tích

```html
<div class="h-event">
  <h2 class="p-name">IndieWeb Summit</h2>
  <time class="dt-start" datetime="2019-06-29T09:00:00-07:00">
    June 29, 2019 at 9:00am (-0700)
  </time>
  <br />through
  <time class="dt-end" datetime="2019-06-30T18:00:00-07:00">
    June 30, 2019 at 6:00pm (-0700)
  </time>
  <br />
  <div class="p-location h-card">
    <div>
      <span class="p-name">Mozilla</span>
    </div>
    <div>
      <span class="p-street-address">1120 NW Couch St</span>,
      <span class="p-locality">Portland</span>,
      <span class="p-region">Oregon</span>,
      <span class="p-country">US</span>
    </div>
    <data class="p-latitude" value="45.52345"></data>
    <data class="p-longitude" value="-122.682677"></data>
  </div>
  <div class="e-content">Come join us</div>
  <div>
    <span class="p-author h-card">
      <a class="u-url p-name" href="https://aaronparecki.com">Aaron Parecki</a>
    </span>
    Published this
    <a href="https://aaronparecki.com/2019/06/29/1/" class="u-url">event </a>on
    <time class="dt published" datetime="2019-05-25T18:00:00-07:00">
      May 5th, 2019
    </time>
  </div>
</div>
```

```json
{
  "items": [
    {
      "type": ["h-event"],
      "properties": {
        "name": ["IndieWeb Summit"],
        "url": ["https://aaronparecki.com/2019/06/29/1/"],
        "author": [
          {
            "type": ["h-card"],
            "properties": {
              "name": ["Aaron Parecki"],
              "url": ["https://aaronparecki.com"]
            },
            "lang": "en",
            "value": "Aaron Parecki"
          }
        ],
        "start": ["2019-06-29T09:00:00-07:00"],
        "end": ["2019-06-30T18:00:00-07:00"],
        "published": ["2019-05-25T18:00:00-07:00"],
        "content": [
          {
            "html": "Come join us",
            "value": "Come join us",
            "lang": "en"
          }
        ],
        "location": [
          {
            "type": ["h-card"],
            "properties": {
              "name": ["Mozilla"],
              "p-street-address": ["1120 NW Couch St"],
              "locality": ["Portland"],
              "region": ["Oregon"],
              "country": ["US"],
              "latitude": ["45.52345"],
              "longitude": ["-122.682677"]
            },
            "lang": "en",
            "value": "Mozilla"
          }
        ]
      },
      "lang": "en"
    }
  ]
}
```

## Ví dụ thuộc tính rel của microformats

Có một số microformats được áp dụng cho trang bằng cách sử dụng thuộc tính `rel=` đặc biệt. Các microformats này mô tả mối quan hệ giữa tài liệu hiện tại và tài liệu được liên kết. Để xem danh sách đầy đủ, xem [thuộc tính rel](https://microformats.org/wiki/rel-values) trên wiki microformats.

### rel=author

Thuộc tính này cho biết tài liệu được liên kết đại diện cho tác giả của trang hiện tại.

```html
<a rel="author" href="https://jamesg.blog">James Gallagher</a>
```

### rel=license

Thuộc tính này cho biết tài liệu được liên kết chứa giấy phép mà trang hiện tại được xuất bản.

```html
<a rel="license" href="https://mit-license.org/">MIT License</a>
```

### rel=nofollow

Thuộc tính này cho biết tài liệu được liên kết không nên được các thuật toán xếp hạng công cụ tìm kiếm đánh trọng số từ trang hiện tại. Điều này hữu ích để ngăn các thuật toán link graph đánh giá một trang cao hơn bình thường sau khi thấy một liên kết đến một tài liệu.

```html
<a rel="nofollow" href="https://jamesg.blog">James Gallagher</a>
```

## Khả năng tương thích trình duyệt

Được hỗ trợ trong tất cả các trình duyệt hỗ trợ thuộc tính class và DOM API của nó.

## Xem thêm

- [thuộc tính class](/en-US/docs/Web/HTML/Reference/Global_attributes/class)
- [Microformat](https://en.wikipedia.org/wiki/Microformat) trên Wikipedia
- [Trang web chính thức Microformats](https://microformats.org/wiki/Main_Page)
- [Hỗ trợ của công cụ tìm kiếm](https://microformats.org/wiki/search_engines) trên trang web chính thức Microformats
- [Microformats trên IndieWebCamp](https://indieweb.org/microformats)
