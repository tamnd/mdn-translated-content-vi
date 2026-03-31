---
title: X-Robots-Tag header
short-title: X-Robots-Tag
slug: Web/HTTP/Reference/Headers/X-Robots-Tag
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề **`X-Robots-Tag`** {{Glossary("response header")}} định nghĩa cách {{glossary("Crawler", "crawler")}} nên đánh chỉ mục URL.
Mặc dù không phải là một phần của bất kỳ đặc tả nào, nó là phương pháp de-facto chuẩn để giao tiếp với các search bot, web crawler, và các tác nhân người dùng tương tự.
Các crawler liên quan đến tìm kiếm sử dụng các quy tắc từ tiêu đề `X-Robots-Tag` để điều chỉnh cách trình bày các trang web hoặc tài nguyên khác trong kết quả tìm kiếm.

Các quy tắc đánh chỉ mục được định nghĩa trong tiêu đề `X-Robots-Tag` hoặc phần tử HTML [`<meta name="robots">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots) (thường được gọi là "robots tag") và được phát hiện khi URL được crawl.
Chỉ định các quy tắc đánh chỉ mục trong tiêu đề HTTP hữu ích cho các tài liệu không phải HTML như hình ảnh, PDF, hoặc phương tiện khác.

> [!NOTE]
> Chỉ có robot hợp tác mới tuân theo các quy tắc này, và crawler trước tiên cần truy cập tài nguyên để đọc tiêu đề và phần tử meta (xem [Tương tác với robots.txt](#interaction_with_robots.txt)).
> Nếu bạn muốn ngăn chặn tiêu thụ băng thông bởi crawler, tệp {{Glossary("robots.txt")}} hạn chế hiệu quả hơn so với các quy tắc đánh chỉ mục vì nó chặn các tài nguyên khỏi bị crawl.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Robots-Tag: <indexing-rule>
X-Robots-Tag: <indexing-rule>, …, <indexing-ruleN>
```

`<bot-name>:` tùy chọn chỉ định tác nhân người dùng mà các quy tắc tiếp theo nên áp dụng:

```http
X-Robots-Tag: <indexing-rule>, <bot-name>: <indexing-rule>
X-Robots-Tag: <bot-name>: <indexing-rule>, …, <indexing-ruleN>
```

Xem [Chỉ định tác nhân người dùng](#specifying_user_agents) để biết ví dụ.

## Chỉ thị

Bất kỳ quy tắc đánh chỉ mục nào sau đây có thể được sử dụng:

- `all`
  - : Không có hạn chế cho việc đánh chỉ mục hoặc phục vụ trong kết quả tìm kiếm.
    Quy tắc này là giá trị mặc định và không có hiệu lực nếu được liệt kê rõ ràng.
- `noindex`
  - : Không hiển thị trang, phương tiện hoặc tài nguyên này trong kết quả tìm kiếm.
    Nếu bỏ qua, trang, phương tiện hoặc tài nguyên có thể được đánh chỉ mục và hiển thị trong kết quả tìm kiếm.
- `nofollow`
  - : Không theo dõi các liên kết trên trang này.
    Nếu bỏ qua, các công cụ tìm kiếm có thể sử dụng các liên kết trên trang để khám phá các trang được liên kết đó.
- `none`
  - : Tương đương với `noindex, nofollow`.
- `nosnippet`
  - : Không hiển thị đoạn văn bản hoặc bản xem trước video trong kết quả tìm kiếm cho trang này.
    Hình thu nhỏ tĩnh (nếu có) vẫn có thể hiển thị.
    Nếu bỏ qua, các công cụ tìm kiếm có thể tạo đoạn văn bản và bản xem trước video dựa trên thông tin tìm thấy trên trang.
    Để loại trừ các phần nhất định của nội dung khỏi việc xuất hiện trong đoạn kết quả tìm kiếm, sử dụng [thuộc tính HTML `data-nosnippet`](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag#data-nosnippet-attr).
- `indexifembedded`
  - : Công cụ tìm kiếm được phép đánh chỉ mục nội dung của trang nếu nó được nhúng trong trang khác qua iframe hoặc các phần tử HTML tương tự, bất chấp quy tắc `noindex`.
    `indexifembedded` chỉ có hiệu lực nếu nó đi kèm với `noindex`.
- `max-snippet: <number>`
  - : Sử dụng tối đa `<number>` ký tự như đoạn văn bản cho kết quả tìm kiếm này.
    Bị bỏ qua nếu không chỉ định `<number>` hợp lệ.
- `max-image-preview: <setting>`
  - : Kích thước tối đa của bản xem trước hình ảnh cho trang này trong kết quả tìm kiếm.
    Nếu bỏ qua, các công cụ tìm kiếm có thể hiển thị bản xem trước hình ảnh với kích thước mặc định.
    Nếu bạn không muốn các công cụ tìm kiếm sử dụng hình ảnh thumbnail lớn hơn, hãy chỉ định giá trị `max-image-preview` là `standard` hoặc `none`. Các giá trị bao gồm:
    - `none`
      - : Không có bản xem trước hình ảnh nào được hiển thị.
    - `standard`
      - : Bản xem trước hình ảnh mặc định có thể được hiển thị.
    - `large`
      - : Bản xem trước hình ảnh lớn hơn, tối đa chiều rộng viewport, có thể được hiển thị.
- `max-video-preview: <number>`
  - : Sử dụng tối đa `<number>` giây như đoạn video cho các video trên trang này trong kết quả tìm kiếm.
    Nếu bỏ qua, các công cụ tìm kiếm có thể hiển thị đoạn video trong kết quả tìm kiếm, và công cụ tìm kiếm quyết định bản xem trước có thể dài bao lâu.
    Bị bỏ qua nếu không chỉ định `<number>` hợp lệ.
    Các giá trị đặc biệt như sau:
    - `0`
      - : Nhiều nhất, một hình ảnh tĩnh có thể được sử dụng, theo cài đặt `max-image-preview`.
    - `-1`
      - : Không có giới hạn độ dài video.
- `notranslate`
  - : Không cung cấp dịch trang này trong kết quả tìm kiếm.
    Nếu bỏ qua, các công cụ tìm kiếm có thể dịch tiêu đề kết quả tìm kiếm và đoạn trích sang ngôn ngữ của truy vấn tìm kiếm.
- `noimageindex`
  - : Không đánh chỉ mục hình ảnh trên trang này.
    Nếu bỏ qua, hình ảnh trên trang có thể được đánh chỉ mục và hiển thị trong kết quả tìm kiếm.
- `unavailable_after: <date/time>`
  - : Yêu cầu không hiển thị trang này trong kết quả tìm kiếm sau `<date/time>` được chỉ định.
    Bị bỏ qua nếu không chỉ định `<date/time>` hợp lệ.
    Ngày phải được chỉ định theo định dạng như {{RFC("822")}}, {{RFC("850")}}, hoặc ISO 8601.

    Theo mặc định không có ngày hết hạn cho nội dung.
    Nếu bỏ qua, trang này có thể hiển thị trong kết quả tìm kiếm vô thời hạn.
    Crawler dự kiến sẽ giảm đáng kể tốc độ crawl của URL sau ngày giờ được chỉ định.

## Mô tả

Các quy tắc đánh chỉ mục qua `<meta name="robots">` và `X-Robots-Tag` được phát hiện khi URL được crawl.
Hầu hết các crawler hỗ trợ các quy tắc trong tiêu đề HTTP `X-Robots-Tag` có thể được sử dụng trong phần tử `<meta name="robots">`.

Trong trường hợp các quy tắc robot xung đột trong `X-Robots-Tag` hoặc giữa tiêu đề HTTP `X-Robots-Tag` và phần tử `<meta name="robots">`, quy tắc hạn chế hơn sẽ áp dụng.
Ví dụ, nếu trang có cả quy tắc `max-snippet:50` và `nosnippet`, quy tắc `nosnippet` sẽ áp dụng.
Các quy tắc đánh chỉ mục sẽ không được phát hiện hoặc áp dụng nếu các đường dẫn bị chặn khỏi việc crawl bởi tệp `robots.txt`.

Một số giá trị loại trừ lẫn nhau, chẳng hạn như `index` và `noindex`, hoặc `follow` và `nofollow`.
Trong những trường hợp này, hành vi của crawler không được xác định và có thể thay đổi.

### Tương tác với robots.txt

Nếu tài nguyên bị chặn khỏi crawl qua tệp `robots.txt`, thì bất kỳ thông tin nào về các quy tắc đánh chỉ mục hoặc phục vụ được chỉ định bằng `<meta name="robots">` hoặc tiêu đề HTTP `X-Robots-Tag` sẽ không được phát hiện và do đó sẽ bị bỏ qua.

Trang bị chặn khỏi crawl vẫn có thể được đánh chỉ mục nếu nó được tham chiếu từ tài liệu khác (xem chỉ thị [`nofollow`](#nofollow)).
Nếu bạn muốn xóa trang khỏi các chỉ mục tìm kiếm, `X-Robots-Tag: noindex` thường sẽ hoạt động, nhưng robot trước tiên phải truy cập lại trang để phát hiện quy tắc `X-Robots-Tag`.

## Ví dụ

### Sử dụng X-Robots-Tag

Tiêu đề `X-Robots-Tag` sau thêm `noindex`, yêu cầu crawler không hiển thị trang, phương tiện hoặc tài nguyên này trong kết quả tìm kiếm:

```http
HTTP/1.1 200 OK
Date: Tue, 03 Dec 2024 17:08:49 GMT
X-Robots-Tag: noindex
```

### Nhiều tiêu đề

Phản hồi sau có hai tiêu đề `X-Robots-Tag`, mỗi tiêu đề với một quy tắc đánh chỉ mục được chỉ định:

```http
HTTP/1.1 200 OK
Date: Tue, 03 Dec 2024 17:08:49 GMT
X-Robots-Tag: noimageindex
X-Robots-Tag: unavailable_after: Wed, 03 Dec 2025 13:09:53 GMT
```

### Chỉ định tác nhân người dùng

Có thể chỉ định tác nhân người dùng nào mà các quy tắc nên áp dụng.
Ví dụ sau chứa hai tiêu đề `X-Robots-Tag` yêu cầu `googlebot` không theo dõi các liên kết trên trang này và crawler `BadBot` hư cấu không đánh chỉ mục trang hoặc theo dõi bất kỳ liên kết nào trên nó:

```http
HTTP/1.1 200 OK
Date: Tue, 03 Dec 2024 17:08:49 GMT
X-Robots-Tag: BadBot: noindex, nofollow
X-Robots-Tag: googlebot: nofollow
```

Trong phản hồi bên dưới, các quy tắc đánh chỉ mục giống nhau được định nghĩa, nhưng trong một tiêu đề duy nhất.
Mỗi quy tắc đánh chỉ mục áp dụng cho tác nhân người dùng được chỉ định phía sau nó:

```http
HTTP/1.1 200 OK
Date: Tue, 03 Dec 2024 17:08:49 GMT
X-Robots-Tag: BadBot: noindex, nofollow, googlebot: nofollow
```

Đối với các tình huống trong đó nhiều crawler được chỉ định cùng với các quy tắc khác nhau, công cụ tìm kiếm sẽ sử dụng tổng của các quy tắc tiêu cực.
Ví dụ:

```http
X-Robots-Tag: nofollow
X-Robots-Tag: googlebot: noindex
```

Trang chứa các tiêu đề này sẽ được diễn giải như có quy tắc `noindex, nofollow` khi được crawl bởi `googlebot`.

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào.

## Xem thêm

- {{Glossary("robots.txt")}}
- {{Glossary("Search engine")}}
- Phần tử HTML [`<meta name="robots">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots) ("robots tag")
- [Hướng dẫn cấu hình robots.txt](/en-US/docs/Web/Security/Practical_implementation_guides/Robots_txt)
- {{RFC("9309", "Robots Exclusion Protocol")}}
- [Using the X-Robots-Tag HTTP header](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag#xrobotstag) trên developers.google.com
