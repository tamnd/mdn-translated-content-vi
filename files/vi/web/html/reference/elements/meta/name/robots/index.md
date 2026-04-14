---
title: <meta name="robots">
short-title: robots
slug: Web/HTML/Reference/Elements/meta/name/robots
page-type: html-attribute-value
sidebar: htmlsidebar
---

Giá trị **`robots`** cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử {{htmlelement("meta")}} (thường được gọi là "thẻ robots") xác định hành vi thu thập dữ liệu và lập chỉ mục mà các {{glossary("Crawler", "trình thu thập dữ liệu")}} web hợp tác nên sử dụng với trang.
Nếu được chỉ định, bạn xác định hướng dẫn cho các trình thu thập dữ liệu trong thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) của phần tử `<meta>` dưới dạng danh sách phân tách bằng dấu phẩy gồm một hoặc nhiều quy tắc.

Ví dụ, để gợi ý cho trình thu thập dữ liệu rằng một trang nên bị loại khỏi chỉ mục tìm kiếm của chúng, có thể sử dụng giá trị `noindex`:

```html
<meta name="robots" content="noindex" />
```

> [!NOTE]
> Chỉ các robots hợp tác mới tuân theo các quy tắc này.
> Một trình thu thập dữ liệu vẫn cần truy cập tài nguyên để đọc các header và phần tử meta (xem [X-Robots-Tag: Tương tác với robots.txt](/en-US/docs/Web/HTTP/Reference/Headers/X-Robots-Tag#interaction_with_robots.txt)).
> Nếu bạn muốn ngăn chặn việc tiêu thụ băng thông bởi các trình thu thập dữ liệu, một tệp {{Glossary("robots.txt")}} hạn chế sẽ hiệu quả hơn các quy tắc lập chỉ mục vì nó chặn hoàn toàn việc thu thập dữ liệu của tài nguyên.

## Ghi chú sử dụng

Một phần tử `<meta name="robots">` có thể có các thuộc tính bổ sung sau:

- [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content)
  - : Thuộc tính `content` phải được xác định và giá trị của nó đặt hành vi lập chỉ mục và thu thập dữ liệu cho các robot tìm kiếm hợp tác.
    Chấp nhận một hoặc nhiều từ khóa sau dưới dạng danh sách phân tách bằng dấu phẩy:
    - `index`
      - : Cho phép robot lập chỉ mục trang. Đây là hành vi mặc định.
        Được sử dụng bởi tất cả các trình thu thập dữ liệu lớn.
    - `noindex`
      - : Yêu cầu robot không lập chỉ mục trang.
        Được sử dụng bởi tất cả các trình thu thập dữ liệu lớn.
    - `follow`
      - : Cho phép robot theo dõi các liên kết trên trang. Đây là hành vi mặc định.
        Được sử dụng bởi tất cả các trình thu thập dữ liệu lớn.
    - `nofollow`
      - : Yêu cầu robot không theo dõi các liên kết trên trang.
        Được sử dụng bởi tất cả các trình thu thập dữ liệu lớn.
    - `all`
      - : Tương đương với `index, follow`.
        Được sử dụng bởi: [Google](https://developers.google.com/search/docs/crawling-indexing/special-tags?visit_id=637855965067987211-415685194&rd=1).
    - `none`
      - : Tương đương với `noindex, nofollow`.
        Được sử dụng bởi: [Google](https://developers.google.com/search/docs/crawling-indexing/special-tags?visit_id=637855965074074862-574753619&rd=1).
    - `noarchive`
      - : Yêu cầu công cụ tìm kiếm không lưu cache nội dung trang.
        Được sử dụng bởi: [Google](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag), [Yahoo](https://help.yahoo.com/kb/search-for-desktop/SLN2213.html), [Bing](https://www.bing.com/webmasters/help/which-robots-metatags-does-bing-support-5198d240).
    - `nosnippet`
      - : Ngăn hiển thị bất kỳ mô tả nào của trang trong kết quả tìm kiếm.
        Được sử dụng bởi: [Google](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag), [Bing](https://www.bing.com/webmasters/help/which-robots-metatags-does-bing-support-5198d240).
    - `noimageindex`
      - : Yêu cầu trang này không xuất hiện như là trang tham chiếu của một hình ảnh được lập chỉ mục.
        Được sử dụng bởi: [Google](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag).
    - `nocache`
      - : Từ đồng nghĩa của `noarchive`.
        Được sử dụng bởi: [Bing](https://www.bing.com/webmasters/help/which-robots-metatags-does-bing-support-5198d240).

## Mô tả

Có một số lưu ý quan trọng cần chú ý khi đặt giá trị meta `robots`:

- Chỉ các robots hợp tác mới tuân theo các quy tắc này. Chúng sẽ không ngăn chặn các tác nhân độc hại như những kẻ thu thập email khỏi việc bỏ qua các chỉ thị.
- Nếu được xác định trong thẻ `<meta>`, các robots vẫn cần truy cập trang để đọc các quy tắc này. Để giảm băng thông, hãy cân nhắc sử dụng [tệp robots.txt](/en-US/docs/Web/Security/Practical_implementation_guides/Robots_txt) thay thế.
- Thẻ `<meta name="robots">` và `robots.txt` phục vụ các vai trò khác nhau: `robots.txt` kiểm soát việc thu thập dữ liệu, trong khi thẻ meta `robots` ảnh hưởng đến việc lập chỉ mục và các hành vi khác.
- Một trang bị chặn bởi `robots.txt` vẫn có thể được lập chỉ mục nếu được liên kết từ các nguồn khác.
- Chỉ thị `noindex` sẽ chỉ có hiệu lực sau khi robot truy cập lại trang, vì vậy hãy đảm bảo `robots.txt` không ngăn điều này.
- Một số giá trị, chẳng hạn như `index` so với `noindex` hoặc `follow` so với `nofollow`, loại trừ lẫn nhau. Hành vi không xác định khi sử dụng các giá trị mâu thuẫn.
- Các robots như Google, Yahoo và Bing cũng hỗ trợ các chỉ thị này trong HTTP header {{HTTPHeader("X-Robots-Tag")}}, điều này hữu ích cho nội dung không phải HTML như PDF hoặc hình ảnh.

## Ví dụ

### Sử dụng từ khóa robots

Ví dụ sau sử dụng `nofollow` để yêu cầu trình thu thập dữ liệu không theo dõi các liên kết trên trang và `noindex` để yêu cầu trang bị loại khỏi lập chỉ mục:

```html
<meta name="robots" content="nofollow, noindex" />
```

## Thông số kỹ thuật

Mặc dù không phải là một phần của bất kỳ đặc tả nào, đây là phương pháp thực tế để giao tiếp với các bot tìm kiếm, trình thu thập dữ liệu web và các user agent tương tự.

## Tương thích trình duyệt

Tính năng này dành cho các trình thu thập dữ liệu quan sát, vì vậy khả năng tương thích "trình duyệt" không áp dụng.

## Xem thêm

- HTTP header {{httpheader("X-Robots-Tag")}}
- Hướng dẫn [cấu hình robots.txt](/en-US/docs/Web/Security/Practical_implementation_guides/Robots_txt)
- Mục từ điển {{Glossary("robots.txt")}}
- Mục từ điển {{Glossary("Search engine")}}
- {{RFC("9309", "Robots Exclusion Protocol")}}
- [Trang WHATWG Wiki MetaExtensions](https://wiki.whatwg.org/wiki/MetaExtensions)
- [Sử dụng thẻ meta robots](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag#robotsmeta) trên developers.google.com
