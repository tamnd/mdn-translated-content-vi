---
title: Tải suy đoán
slug: Web/Performance/Guides/Speculative_loading
page-type: guide
sidebar: performancesidebar
---

**Tải suy đoán** là việc thực hiện trước các hành động điều hướng, chẳng hạn như tra cứu DNS, tải tài nguyên hoặc kết xuất tài liệu, trước khi các trang liên quan thực sự được truy cập, dựa trên dự đoán về những trang mà người dùng có khả năng truy cập tiếp theo.

Những dự đoán này có thể do nhà phát triển cung cấp, chẳng hạn như danh sách các đích đến phổ biến nhất trên trang của họ, hoặc do các heuristic của trình duyệt xác định, chẳng hạn dựa trên các trang thường được người dùng truy cập trong lịch sử. Khi được dùng thành công, các công nghệ như vậy có thể cải thiện đáng kể hiệu năng bằng cách làm cho trang sẵn sàng nhanh hơn, hoặc trong một số trường hợp là gần như tức thì.

Trang này xem xét các công nghệ tải suy đoán hiện có và khi nào chúng có thể hoặc nên được dùng để cải thiện hiệu năng.

## Các cơ chế tải suy đoán

Có một số cơ chế cho tải suy đoán:

- **Tải trước** là việc lấy trước một phần hoặc toàn bộ tài nguyên cần để kết xuất một tài liệu, hoặc một phần của tài liệu, trước khi chúng cần đến, để khi đến lúc kết xuất thì việc hiển thị có thể diễn ra nhanh hơn nhiều.
- **Prerendering** đi xa hơn một bước, và thực sự kết xuất sẵn nội dung để hiển thị khi cần. Tùy vào cách thực hiện, điều này có thể dẫn đến việc điều hướng ngay lập tức từ trang cũ sang trang mới.
- **Preconnecting** là việc tăng tốc các lần tải tương lai từ một origin nhất định bằng cách thực hiện trước một phần hoặc toàn bộ bước bắt tay kết nối, tức DNS + TCP + TLS.

> [!NOTE]
> Các mô tả ở trên mang tính khái quát và cấp cao. Chính xác trình duyệt sẽ làm gì để đạt được prefetching và prerendering phụ thuộc vào các tính năng được sử dụng. Mô tả chi tiết hơn được cung cấp trong phần [Tính năng tải suy đoán](#speculative_loading_features) bên dưới.

## Tải suy đoán được thực hiện như thế nào?

Tải suy đoán được thực hiện theo hai cách chính.

Thứ nhất, một số trình duyệt sẽ tự động prerender các trang dựa trên nhiều heuristic khác nhau để mang lại cải thiện hiệu năng tự động. Cụ thể trình duyệt làm điều này như thế nào còn phụ thuộc vào cách triển khai. Ví dụ, Chrome sẽ tự động prerender các trang khi các chuỗi khớp được nhập vào thanh địa chỉ nếu nó có độ tin cậy cao rằng bạn sẽ truy cập trang đó (xem [Xem các dự đoán của thanh địa chỉ Chrome](https://developer.chrome.com/docs/web-platform/prerender-pages#view_chromes_address_bar_predictions) để biết thêm chi tiết). Ngoài ra, nó có thể tự động prerender các trang kết quả tìm kiếm khi thuật ngữ tìm kiếm được nhập vào thanh địa chỉ, khi công cụ tìm kiếm yêu cầu điều đó. Nó làm việc này bằng cùng cơ chế như [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).

Thứ hai, có một số tính năng nền tảng khác nhau mà nhà phát triển có thể dùng để cung cấp chỉ dẫn về kiểu tải suy đoán mà họ muốn trình duyệt thực hiện. Những tính năng này sẽ được xem xét ở phần tiếp theo.

## Các tính năng tải suy đoán

### `<link rel="preconnect">`

[`<link rel="preconnect">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) cung cấp gợi ý cho trình duyệt rằng người dùng có khả năng cần tài nguyên từ origin của tài nguyên được chỉ định, và do đó trình duyệt có thể cải thiện hiệu năng bằng cách khởi tạo trước kết nối đến origin đó. Các trình duyệt hỗ trợ sẽ thực hiện trước một phần hoặc toàn bộ bước bắt tay kết nối, tức DNS + TCP + TLS.

Ví dụ:

```html
<link rel="preconnect" href="https://example.com" />
```

`<link rel="preconnect">` được hỗ trợ rộng rãi trên các trình duyệt và sẽ mang lại lợi ích cho mọi yêu cầu HTTP, điều hướng hoặc subresource thuộc cross-origin trong tương lai. Nó không có lợi cho các yêu cầu cùng origin vì kết nối đã mở sẵn.

Nếu một trang cần kết nối tới nhiều miền bên thứ ba, việc preconnect tất cả có thể phản tác dụng. Gợi ý `<link rel="preconnect">` nên chỉ dùng cho những kết nối quan trọng nhất. Với các kết nối còn lại, chỉ cần dùng `<link rel="dns-prefetch">` để tiết kiệm thời gian ở bước đầu tiên, tức tra cứu DNS.

Bạn cũng có thể triển khai preconnect dưới dạng HTTP [`Link`](/en-US/docs/Web/HTTP/Reference/Headers/Link) header, ví dụ:

```http
Link: <https://example.com>; rel="preconnect"
```

### `<link rel="dns-prefetch">`

[`<link rel="dns-prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/dns-prefetch) cung cấp gợi ý cho trình duyệt rằng người dùng có khả năng cần tài nguyên từ origin của tài nguyên được chỉ định, và do đó trình duyệt có thể cải thiện hiệu năng bằng cách thực hiện trước phân giải DNS cho origin đó. Nó giống với `<link rel="preconnect">` ngoại trừ việc chỉ xử lý phần DNS.

Một lần nữa, hỗ trợ trình duyệt là rất rộng rãi, và nó không có lợi cho các yêu cầu cùng origin vì kết nối đã mở sẵn.

Ví dụ:

```html
<link rel="dns-prefetch" href="https://example.com" />
```

> [!NOTE]
> Xem [Sử dụng dns-prefetch](/en-US/docs/Web/Performance/Guides/dns-prefetch) để biết thêm chi tiết.

### `<link rel="preload">`

[`<link rel="preload">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) cung cấp gợi ý cho trình duyệt về những tài nguyên nào là ưu tiên cao trên _trang hiện tại_, để nó có thể bắt đầu tải chúng sớm khi thấy phần tử {{htmlelement("link")}} trong {{htmlelement("head")}} của trang.

Ví dụ:

```html
<link rel="preload" href="main.js" as="script" />
<!-- CORS-enabled preload -->
<link
  rel="preload"
  href="https://www.example.com/fonts/cicle_fina-webfont.woff2"
  as="font"
  type="font/woff2"
  crossorigin />
```

Kết quả sẽ được giữ trong bộ nhớ đệm trong bộ nhớ dành riêng cho tài liệu. Nếu bạn preload thứ gì đó mà trang hiện tại không dùng làm subresource, thì thường đó là lãng phí tài nguyên, dù kết quả có thể điền vào HTTP cache nếu tiêu đề cho phép.

Bạn cũng có thể triển khai preload dưới dạng HTTP [`Link`](/en-US/docs/Web/HTTP/Reference/Headers/Link) header, ví dụ:

```http
Link: <https://www.example.com/fonts/cicle_fina-webfont.woff2>; rel="preload"
```

Hỗ trợ trình duyệt cho `<link rel="preload">`/`<link rel="modulepreload">` đã phổ biến trên các trình duyệt hiện đại.

### `<link rel="modulepreload">`

[`<link rel="modulepreload">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload) cung cấp gợi ý cho trình duyệt về những mô-đun JavaScript nào là ưu tiên cao trên _trang hiện tại_, để nó có thể bắt đầu tải chúng sớm.

Ví dụ:

```html
<link rel="modulepreload" href="main.js" />
```

Đây là phiên bản chuyên biệt của `<link rel="preload">` dành cho [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules), và hoạt động gần như giống hệt. Tuy nhiên, có một vài điểm khác:

- Trình duyệt biết tài nguyên là một mô-đun JavaScript, vì không cần thuộc tính `as`, và nó có thể dùng đúng chế độ thông tin xác thực để tránh tải hai lần.
- Thay vì chỉ tải xuống rồi lưu vào bộ nhớ đệm, trình duyệt tải xuống, sau đó phân tích cú pháp và biên dịch trực tiếp vào module map trong bộ nhớ.
- Trình duyệt cũng có thể tự động làm điều tương tự cho các phụ thuộc của mô-đun.

Nó cũng có thể triển khai dưới dạng HTTP [`Link`](/en-US/docs/Web/HTTP/Reference/Headers/Link) header, ví dụ:

```http
Link: <https://example.com/module.js>; rel="modulepreload"
```

### `<link rel="prefetch">`

[`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch) cung cấp gợi ý cho trình duyệt rằng người dùng có khả năng cần tài nguyên đích cho các lần điều hướng tương lai, và do đó trình duyệt có thể cải thiện trải nghiệm người dùng bằng cách chủ động tải và lưu vào bộ nhớ đệm tài nguyên đó. `<link rel="prefetch">` được dùng cho các tài nguyên điều hướng cùng site, hoặc cho các subresource được dùng bởi các trang cùng site.

Ví dụ:

```html
<link rel="prefetch" href="main.js" />
```

Việc prefetch có thể dùng để tải cả HTML lẫn các subresource cho một lần điều hướng tiếp theo có thể xảy ra. Một trường hợp sử dụng phổ biến là một trang đích đơn giản của website tải thêm các tài nguyên "nặng" được dùng cho phần còn lại của site.

```html
<link rel="prefetch" href="/app/style.css" />
<link rel="prefetch" href="/landing-page" />
```

> [!NOTE]
> Kết quả được giữ trong HTTP cache trên đĩa. Vì vậy, prefetch subresource rất hữu ích, ngay cả khi chúng không được dùng bởi trang hiện tại. Bạn cũng có thể dùng nó để prefetch tài liệu tiếp theo mà người dùng có khả năng sẽ truy cập trên site. Tuy nhiên, vì vậy bạn cần cẩn thận với các header - ví dụ một số header [Cache-Control](/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control) có thể chặn prefetching, chẳng hạn `no-cache` hoặc `no-store`.
>
> Nhiều trình duyệt hiện nay triển khai một dạng [phân vùng cache](https://developer.chrome.com/blog/http-cache-partitioning), làm cho `<link rel="prefetch">` trở nên vô dụng với các tài nguyên dành cho các top-level site khác. Điều này bao gồm cả tài liệu chính khi điều hướng cross-site. Vì vậy, ví dụ, prefetch sau:
>
> ```html
> <link rel="prefetch" href="https://news.example/article" />
> ```
>
> sẽ không thể truy cập từ `https://aggregator.example/`.

> [!NOTE]
> `<link rel="prefetch">` về mặt chức năng tương đương với một lời gọi {{domxref("Window/fetch", "fetch()")}} có đặt tùy chọn `priority: "low"`, ngoại trừ việc cách trước thường có mức ưu tiên còn thấp hơn nữa, và nó sẽ đặt header [`Sec-Purpose: prefetch`](/en-US/docs/Web/HTTP/Reference/Headers/Sec-Purpose) trên yêu cầu.

> [!NOTE]
> Yêu cầu fetch cho một thao tác `prefetch` sẽ tạo ra một HTTP Request có chứa header HTTP [`Sec-Purpose: prefetch`](/en-US/docs/Web/HTTP/Reference/Headers/Sec-Purpose). Một máy chủ có thể dùng header này để thay đổi thời gian chờ cache cho các tài nguyên, hoặc thực hiện các xử lý đặc biệt khác.
> Yêu cầu cũng sẽ bao gồm header {{HTTPHeader("Sec-Fetch-Dest")}} với giá trị được đặt thành `empty`.
> Header {{HTTPHeader("Accept")}} trong yêu cầu sẽ khớp với giá trị dùng cho các yêu cầu điều hướng bình thường. Điều này cho phép trình duyệt tìm các tài nguyên đã được lưu vào cache tương ứng sau khi điều hướng.
> Nếu trả về phản hồi, phản hồi đó sẽ được lưu vào cache cùng với yêu cầu trong HTTP cache.

### `<link rel="prerender">` {{deprecated_inline}}{{non-standard_inline}}

> [!NOTE]
> Công nghệ này chỉ từng có trong Chrome, và nay đã bị ngừng dùng và [không còn thực hiện prerender như tên gọi gợi ý](https://developer.chrome.com/blog/nostate-prefetch). Bạn nên dùng [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) thay thế, vì API này đã thay thế nó.

[`<link rel="prerender">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prerender) cung cấp gợi ý cho trình duyệt rằng người dùng có thể cần tài nguyên đích cho lần điều hướng tiếp theo, và do đó trình duyệt có thể cải thiện hiệu năng bằng cách prerender tài nguyên đó. `prerender` được dùng cho các điều hướng tương lai, chỉ cùng site, và vì thế phù hợp với multi-page application (MPA) hơn là single-page application (SPA).

Ví dụ:

```html
<link rel="prerender" href="/next-page" />
```

Nó sẽ tải tài liệu được tham chiếu, sau đó tải thêm mọi tài nguyên được liên kết có thể tìm thấy tĩnh và cũng lưu chúng vào HTTP cache trên đĩa với thời gian chờ năm phút. Ngoại lệ là các subresource được tải qua JavaScript, vì nó không phát hiện được các tài nguyên này. Nó còn có các vấn đề khác nữa - giống như `<link rel="prefetch">`, nó cũng có thể bị chặn bởi các header [Cache-Control](/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control), và trở nên vô dụng đối với các tài nguyên dành cho các top-level site khác do cơ chế [phân vùng cache](https://developer.chrome.com/blog/http-cache-partitioning) của trình duyệt.

### Speculation Rules API

[Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) được dùng để chỉ định một tập hợp quy tắc xác định những tài liệu tương lai nào nên được trình duyệt prefetch hoặc prerender. Các quy tắc này được cung cấp dưới dạng cấu trúc JSON bên trong các phần tử inline [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) và các tệp văn bản bên ngoài được tham chiếu bởi header phản hồi {{httpheader("Speculation-Rules")}}.

## Khi nào nên dùng từng tính năng?

Bảng sau tóm tắt các tính năng đã nêu ở trên và đưa ra hướng dẫn về khi nào nên dùng từng tính năng.

| Tính năng tải suy đoán                                                                      | Mục đích                                                 | Khi nào nên dùng                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [`<link rel="preconnect">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect)       | Làm ấm kết nối cross-origin                              | Dùng trên những kết nối cross-origin quan trọng nhất để mang lại cải thiện hiệu năng khi kết nối tới chúng.                                                                                                                                                                                                                                                                                                                                |
| [`<link rel="dns-prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/dns-prefetch)   | Làm ấm kết nối cross-origin                              | Dùng trên tất cả các kết nối cross-origin của bạn để mang lại cải thiện hiệu năng nhỏ khi kết nối tới chúng.                                                                                                                                                                                                                                                                                                                               |
| [`<link rel="preload">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload)             | Tải ưu tiên cao các subresource của trang hiện tại       | Dùng để tải nhanh hơn các tài nguyên ưu tiên cao trên trang hiện tại, nhằm cải thiện hiệu năng có tính chiến lược. Đừng preload mọi thứ, nếu không bạn sẽ không thấy lợi ích. Nó còn có một số cách dùng thú vị khác, xem [Preload: What Is It Good For?](https://www.smashingmagazine.com/2016/02/preload-what-is-it-good-for/) trên Smashing Magazine (2016).                                                                            |
| [`<link rel="modulepreload">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload) | Tải ưu tiên cao các mô-đun JavaScript của trang hiện tại | Dùng để preload các mô-đun JavaScript ưu tiên cao nhằm cải thiện hiệu năng có tính chiến lược.                                                                                                                                                                                                                                                                                                                                             |
| [`<link rel="prefetch">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch)           | Điền trước HTTP cache                                    | Dùng để prefetch các tài nguyên điều hướng tương lai cùng site hoặc các subresource được dùng trên những trang đó. Nó dùng HTTP cache nên có một số vấn đề với việc prefetch tài liệu, chẳng hạn có thể bị chặn bởi các header [Cache-Control](/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control). Hãy dùng [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) cho việc prefetch tài liệu thay thế, nơi nó được hỗ trợ. |
| [`<link rel="prerender">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prerender)         | Chuẩn bị cho lần điều hướng tiếp theo                    | Đã lỗi thời; bạn không nên dùng. Hãy dùng prerender của [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) thay thế, nơi nó được hỗ trợ.                                                                                                                                                                                                                                                                                   |
| [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) prefetch                 | Chuẩn bị cho lần điều hướng tiếp theo                    | Dùng để prefetch các tài liệu điều hướng tương lai cùng site hoặc cross-site. Nên được áp dụng rộng rãi, nơi được hỗ trợ; hãy kiểm tra để bảo đảm các trang đó [an toàn để prefetch](/en-US/docs/Web/API/Speculation_Rules_API#unsafe_prefetching). Nó không xử lý việc prefetch subresource; cho việc đó bạn cần dùng `<link rel="prefetch">`.                                                                                            |
| [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) prerender                | Chuẩn bị cho lần điều hướng tiếp theo                    | Dùng để preload các tài nguyên điều hướng tương lai cùng origin, cho các lần điều hướng gần như tức thì. Dùng trên những trang ưu tiên cao, nơi được hỗ trợ; hãy kiểm tra để bảo đảm các trang đó [an toàn để prerender](/en-US/docs/Web/API/Speculation_Rules_API#unsafe_prerendering).                                                                                                                                                   |

## Xem thêm

- [Prerender trang trong Chrome để điều hướng trang tức thì](https://developer.chrome.com/docs/web-platform/prerender-pages) trên developer.chrome.com (2023)
