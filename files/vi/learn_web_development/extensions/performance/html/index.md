---
title: Tối ưu hóa hiệu suất HTML
short-title: HTML có hiệu suất cao
slug: Learn_web_development/Extensions/Performance/HTML
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/JavaScript", "Learn_web_development/Extensions/Performance/CSS", "Learn_web_development/Extensions/Performance")}}

HTML theo mặc định nhanh và có thể truy cập. Đó là công việc của chúng ta, với tư cách là nhà phát triển, để đảm bảo rằng chúng ta duy trì hai thuộc tính này khi tạo hoặc chỉnh sửa mã HTML. Các vấn đề có thể xảy ra khi, ví dụ, kích thước tệp của nhúng {{htmlelement("video")}} quá lớn hoặc khi phân tích JavaScript chặn kết xuất của các phần tử trang quan trọng. Bài viết này hướng dẫn bạn qua các tính năng hiệu suất HTML chính có thể cải thiện đáng kể chất lượng trang web của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu về ảnh hưởng của HTML đến hiệu suất trang web và cách tối ưu hóa HTML để cải thiện hiệu suất.
      </td>
    </tr>
  </tbody>
</table>

## Tối ưu hóa hay không tối ưu hóa

Câu hỏi đầu tiên bạn nên trả lời trước khi bắt đầu tối ưu hóa HTML của mình là "tôi cần tối ưu hóa điều gì?". Một số mẹo và kỹ thuật được thảo luận dưới đây là các phương pháp hay nhất sẽ mang lại lợi ích cho hầu hết mọi dự án web, trong khi một số chỉ cần thiết trong các tình huống nhất định. Cố gắng áp dụng tất cả các kỹ thuật này ở mọi nơi có thể là không cần thiết và có thể là lãng phí thời gian của bạn. Bạn nên tìm ra những tối ưu hóa hiệu suất nào thực sự cần thiết trong mỗi dự án.

Để làm điều này, bạn cần [đo lường hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance) của trang web. Như liên kết này cho thấy, có nhiều cách khác nhau để đo lường hiệu suất, một số liên quan đến [các API hiệu suất](/en-US/docs/Web/API/Performance_API) phức tạp. Cách tốt nhất để bắt đầu, tuy nhiên, là tìm hiểu cách sử dụng các công cụ như các công cụ [mạng](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#network_monitor_tools) và [hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#performance_monitor_tools) tích hợp trong trình duyệt, để kiểm tra các phần tải trang đang mất nhiều thời gian và cần tối ưu hóa.

## Các vấn đề hiệu suất HTML chính

HTML đơn giản về mặt hiệu suất — nó chủ yếu là văn bản, kích thước nhỏ, do đó phần lớn tải xuống và kết xuất nhanh chóng. Các vấn đề chính có thể ảnh hưởng đến hiệu suất của trang web bao gồm:

- Kích thước tệp hình ảnh và video: Quan trọng là phải xem xét cách xử lý nội dung của các phần tử thay thế như {{htmlelement("img")}} và {{htmlelement("video")}}. Các tệp hình ảnh và video lớn và có thể thêm đáng kể vào trọng lượng của trang. Do đó, quan trọng là giảm thiểu lượng byte được tải xuống trên thiết bị của người dùng (ví dụ, phục vụ hình ảnh nhỏ hơn cho di động). Bạn cũng cần xem xét cải thiện hiệu suất cảm nhận bằng cách chỉ tải hình ảnh và video trên trang khi cần thiết.
- Phân phối nội dung nhúng: Đây thường là nội dung được nhúng trong các phần tử {{htmlelement("iframe")}}. Tải nội dung vào `<iframe>`s có thể ảnh hưởng đáng kể đến hiệu suất, vì vậy nó nên được xem xét cẩn thận.
- Thứ tự tải tài nguyên: Để tối đa hóa hiệu suất cảm nhận và thực tế, HTML nên được tải trước, theo thứ tự xuất hiện trên trang. Bạn có thể sử dụng các tính năng khác nhau để ảnh hưởng đến thứ tự tải tài nguyên để có hiệu suất tốt hơn. Ví dụ, bạn có thể preload CSS và phông chữ quan trọng sớm, nhưng hoãn JavaScript không quan trọng đến sau.

> [!NOTE]
> Có một lập luận được đưa ra để đơn giản hóa cấu trúc HTML của bạn và [thu nhỏ](<https://en.wikipedia.org/wiki/Minification_(programming)>) mã nguồn của bạn, để kết xuất và tải xuống nhanh hơn. Tuy nhiên, kích thước tệp HTML không đáng kể so với hình ảnh và video, và kết xuất trình duyệt rất nhanh ngày nay. Nếu nguồn HTML của bạn quá lớn và phức tạp đến mức tạo ra các vấn đề về hiệu suất kết xuất và tải xuống, bạn có thể có những vấn đề lớn hơn, và nên cố gắng đơn giản hóa nó và chia nhỏ nội dung.

## Xử lý đáp ứng của các phần tử thay thế

[Thiết kế đáp ứng](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design) đã cách mạng hóa cách xử lý bố cục nội dung web trên các thiết bị khác nhau. Một lợi thế chính mà nó cho phép là chuyển đổi động các bố cục được tối ưu hóa cho các kích thước màn hình khác nhau, ví dụ bố cục màn hình rộng so với bố cục màn hình hẹp (di động). Nó cũng có thể xử lý chuyển đổi động nội dung dựa trên các thuộc tính thiết bị khác, chẳng hạn như độ phân giải hoặc tùy chọn cho chế độ màu sáng hoặc tối.

Kỹ thuật gọi là "mobile first" có thể đảm bảo rằng bố cục mặc định là dành cho các thiết bị màn hình nhỏ, vì vậy di động chỉ cần tải xuống hình ảnh phù hợp với màn hình của chúng, và không cần phải chịu chi phí hiệu suất khi tải xuống các hình ảnh máy tính lớn hơn. Tuy nhiên, vì điều này được kiểm soát bằng cách sử dụng [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) trong CSS, nó chỉ có thể ảnh hưởng tích cực đến hiệu suất của hình ảnh được tải trong CSS.

Trong các phần dưới đây, chúng ta sẽ tóm tắt cách triển khai các phần tử thay thế đáp ứng. Bạn có thể tìm thấy nhiều chi tiết hơn về các triển khai này trong hướng dẫn [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) và [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images).

### Cung cấp các độ phân giải hình ảnh khác nhau qua srcset

Để cung cấp các phiên bản độ phân giải khác nhau của cùng một hình ảnh tùy thuộc vào độ phân giải và kích thước viewport của thiết bị, bạn có thể sử dụng các thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) và [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes).

Ví dụ này cung cấp các hình ảnh có kích thước khác nhau cho các độ rộng màn hình khác nhau:

```html
<img
  srcset="480w.jpg 480w, 800w.jpg 800w"
  sizes="(width <= 600px) 480px,
         800px"
  src="800w.jpg"
  alt="Family portrait" />
```

`srcset` cung cấp kích thước nội tại của các hình ảnh nguồn cùng với tên tệp của chúng, và `sizes` cung cấp các media queries cùng với các độ rộng slot hình ảnh cần được lấp đầy trong mỗi trường hợp. Trình duyệt sau đó quyết định hình ảnh nào có ý nghĩa để tải cho mỗi slot. Ví dụ, nếu độ rộng màn hình là `600px` hoặc ít hơn, thì `width <= 600px` là đúng, và do đó slot cần lấp đầy được cho là `480px`. Trong trường hợp này, trình duyệt có thể sẽ chọn tải tệp 480w.jpg (hình ảnh rộng 480px). Điều này giúp cải thiện hiệu suất vì trình duyệt không tải các hình ảnh lớn hơn mức cần thiết.

Ví dụ này cung cấp các hình ảnh độ phân giải khác nhau cho các độ phân giải màn hình khác nhau:

```html
<img
  srcset="320w.jpg, 480w.jpg 1.5x, 640w.jpg 2x"
  src="640w.jpg"
  alt="Family portrait" />
```

`1.5x`, `2x`, v.v. là các chỉ số độ phân giải tương đối. Nếu hình ảnh được tạo kiểu có độ rộng 320px (ví dụ với `width: 320px` trong CSS), trình duyệt sẽ tải `320w.jpg` nếu thiết bị có độ phân giải thấp (một {{glossary("device pixel")}} trên mỗi pixel CSS), hoặc `640x.jpg` nếu thiết bị có độ phân giải cao (hai pixel thiết bị trên mỗi pixel CSS hoặc nhiều hơn).

Trong cả hai trường hợp, thuộc tính `src` cung cấp hình ảnh mặc định để tải nếu trình duyệt không hỗ trợ `src`/`srcset`.

### Cung cấp các nguồn khác nhau cho hình ảnh và video

Phần tử {{htmlelement("picture")}} xây dựng dựa trên phần tử {{htmlelement("img")}} truyền thống, cho phép bạn cung cấp nhiều nguồn khác nhau cho các tình huống khác nhau. Ví dụ nếu bố cục rộng, bạn có thể muốn hình ảnh rộng, và nếu hẹp, bạn sẽ muốn hình ảnh hẹp hơn vẫn hoạt động trong ngữ cảnh đó.

Tất nhiên, điều này cũng hoạt động để cung cấp tải xuống thông tin nhỏ hơn trên các thiết bị di động, giúp cải thiện hiệu suất.

Một ví dụ như sau:

```html
<picture>
  <source media="(width < 800px)" srcset="narrow-banner-480w.jpg" />
  <source media="(width >= 800px)" srcset="wide-banner-800w.jpg" />
  <img src="large-banner-800w.jpg" alt="Dense forest scene" />
</picture>
```

Các phần tử {{htmlelement("source")}} chứa các media queries bên trong các thuộc tính `media`. Nếu một media query trả về true, hình ảnh được tham chiếu trong thuộc tính `srcset` của phần tử `<source>` đó được tải. Trong ví dụ trên, nếu độ rộng viewport nhỏ hơn `800px`, hình ảnh `narrow-banner-480w.jpg` được tải. Cũng lưu ý cách phần tử `<picture>` bao gồm phần tử `<img>`, cung cấp hình ảnh mặc định để tải trong trường hợp các trình duyệt không hỗ trợ `<picture>`.

Lưu ý việc sử dụng thuộc tính `srcset` trong ví dụ này. Như được hiển thị trong phần trước, bạn có thể cung cấp các độ phân giải khác nhau cho mỗi nguồn hình ảnh.

Các phần tử `<video>` hoạt động theo cách tương tự, về mặt cung cấp các nguồn khác nhau:

```html
<video controls>
  <source src="video/smaller.mp4" type="video/mp4" />
  <source src="video/smaller.webm" type="video/webm" />
  <source src="video/larger.mp4" type="video/mp4" media="(width >= 800px)" />
  <source src="video/larger.webm" type="video/webm" media="(width >= 800px)" />

  <!-- fallback for browsers that don't support video element -->
  <a href="video/larger.mp4">download video</a>
</video>
```

Tuy nhiên, có một số điểm khác biệt chính giữa việc cung cấp nguồn cho hình ảnh và video:

- Trong ví dụ trên, chúng ta đang sử dụng `src` thay vì `srcset`; bạn không thể chỉ định các độ phân giải khác nhau cho video qua `srcset`.
- Thay vào đó, bạn chỉ định các độ phân giải khác nhau bên trong các phần tử `<source>` khác nhau.
- Lưu ý cách chúng ta cũng đang chỉ định các định dạng video khác nhau bên trong các phần tử `<source>` khác nhau, với mỗi định dạng được xác định thông qua kiểu MIME trong thuộc tính `type`. Trình duyệt sẽ tải cái đầu tiên mà nó gặp mà nó hỗ trợ, nơi bài kiểm tra media query trả về true.

### Tải lười hình ảnh

Một kỹ thuật rất hữu ích để cải thiện hiệu suất là **tải lười (lazy loading)**. Điều này đề cập đến thực hành không tải tất cả hình ảnh ngay lập tức khi HTML được kết xuất, mà thay vào đó chỉ tải chúng khi chúng thực sự hiển thị với người dùng trong viewport (hoặc sắp hiển thị). Điều này có nghĩa là nội dung hiển thị/có thể sử dụng ngay lập tức đã sẵn sàng để sử dụng nhanh hơn, trong khi nội dung tiếp theo chỉ có hình ảnh được kết xuất khi cuộn đến, và trình duyệt sẽ không lãng phí băng thông tải hình ảnh mà người dùng sẽ không bao giờ thấy.

Tải lười trong lịch sử đã được xử lý bằng JavaScript, nhưng các trình duyệt hiện nay có thuộc tính `loading` sẵn có có thể hướng dẫn trình duyệt tải lười hình ảnh tự động:

```html
<img src="800w.jpg" alt="Family portrait" loading="lazy" />
```

Xem [Tải lười hình ảnh cấp độ trình duyệt cho web](https://web.dev/articles/browser-level-image-lazy-loading) trên web.dev để biết thông tin chi tiết.

### Tải lười video và âm thanh

Bạn cũng có thể tải lười nội dung video cho đến khi video được phát, bằng cách sử dụng thuộc tính `preload`. Ví dụ:

```html
<video controls preload="none" poster="poster.jpg">
  <source src="video.webm" type="video/webm" />
  <source src="video.mp4" type="video/mp4" />
</video>
```

Đặt `preload` với giá trị `none` cho trình duyệt biết không preload bất kỳ dữ liệu video nào trước khi người dùng quyết định phát nó, điều này rõ ràng là tốt cho hiệu suất. Thay vào đó, nó chỉ hiển thị hình ảnh được chỉ định bởi thuộc tính `poster`. Các trình duyệt khác nhau có hành vi tải video mặc định khác nhau, vì vậy tốt nhất là rõ ràng.

Đặt `preload` với giá trị `metadata` yêu cầu trình duyệt tải xuống dữ liệu tối thiểu cần thiết để hiển thị video trước khi phát (ví dụ như độ dài, kích thước và có thể khung hình đầu tiên).

Thuộc tính `loading` có thể tăng cường hơn nữa tải lười cho video bằng cách hoãn tải bất kỳ dữ liệu video nào, bất kể giá trị `preload`, cũng như hoãn tải hình ảnh `poster`, cho đến khi video gần viewport (tại điểm đó giá trị `preload` được sử dụng như thường lệ).

```html
<video controls preload="none" poster="poster.jpg" loading="lazy">
  <source src="video.webm" type="video/webm" />
  <source src="video.mp4" type="video/mp4" />
</video>
```

Điều này cũng có thể được sử dụng với nội dung âm thanh:

```html
<audio
  controls
  src="/shared-assets/audio/t-rex-roar.mp3"
  loading="lazy"></audio>
```

Xem [Phát lại nhanh với preload âm thanh và video](https://web.dev/articles/fast-playback-with-preload) trên web.dev để biết thông tin chi tiết.

## Xử lý nội dung nhúng

Rất phổ biến khi nội dung được nhúng trong các trang web từ các nguồn khác. Điều này thường được thực hiện nhất khi hiển thị quảng cáo trên trang web để tạo doanh thu — quảng cáo thường được tạo bởi công ty bên thứ ba và được nhúng vào trang của bạn. Các việc sử dụng khác có thể bao gồm:

- Hiển thị nội dung dùng chung mà người dùng có thể cần trên nhiều trang, như giỏ hàng hoặc thông tin hồ sơ.
- Hiển thị nội dung bên thứ ba liên quan đến trang web chính của tổ chức, chẳng hạn như nguồn cấp dữ liệu bài đăng mạng xã hội.

Nhúng nội dung thường được thực hiện nhất bằng cách sử dụng các phần tử {{htmlelement("iframe")}}, mặc dù các phần tử nhúng ít được sử dụng hơn cũng tồn tại, như {{htmlelement("object")}} và {{htmlelement("embed")}}. Chúng ta sẽ tập trung vào `<iframe>`s trong phần này.

Lời khuyên quan trọng và chính về việc sử dụng `<iframe>`s là: "Đừng sử dụng `<iframe>` nhúng trừ khi bạn thực sự phải làm vậy". Nếu bạn đang tạo một trang với nhiều ngăn thông tin khác nhau, có thể nghe hợp lý về mặt tổ chức khi chia chúng thành các trang riêng biệt và tải chúng vào các `<iframe>` khác nhau. Tuy nhiên, điều này có một số vấn đề liên quan đến nó về hiệu suất và những vấn đề khác:

- Tải nội dung vào `<iframe>` tốn kém hơn nhiều so với tải nội dung như một phần của cùng trang trực tiếp — không chỉ yêu cầu các yêu cầu HTTP bổ sung để tải nội dung, nhưng trình duyệt cũng cần tạo một phiên bản trang riêng biệt cho mỗi cái. Mỗi cái thực sự là một phiên bản trang web riêng biệt được nhúng trong trang web cấp cao nhất.
- Tiếp theo từ điểm trước, bạn cũng sẽ cần xử lý bất kỳ tạo kiểu CSS hoặc thao tác JavaScript riêng biệt cho từng `<iframe>` khác nhau (trừ khi các trang được nhúng có cùng nguồn gốc), điều này trở nên phức tạp hơn nhiều. Bạn không thể nhắm mục tiêu nội dung được nhúng với CSS và JavaScript được áp dụng cho trang cấp cao nhất, hoặc ngược lại. Đây là biện pháp bảo mật hợp lý là nền tảng của web. Hãy tưởng tượng tất cả các vấn đề bạn có thể gặp phải nếu nội dung được nhúng của bên thứ ba có thể tùy ý chạy tập lệnh trên bất kỳ trang nào nó được nhúng vào!
- Mỗi `<iframe>` cũng sẽ cần tải bất kỳ dữ liệu và tệp phương tiện dùng chung riêng biệt — bạn không thể chia sẻ các tài nguyên được bộ nhớ đệm qua các nhúng trang khác nhau (một lần nữa, trừ khi các trang được nhúng có cùng nguồn gốc). Điều này có thể dẫn đến một trang sử dụng nhiều băng thông hơn bạn có thể mong đợi.

Nên đặt nội dung vào một trang duy nhất. Nếu bạn muốn kéo vào nội dung mới động khi trang thay đổi, vẫn tốt hơn cho hiệu suất khi tải nó vào cùng trang hơn là đặt nó vào `<iframe>`. Bạn có thể lấy dữ liệu mới bằng cách sử dụng phương thức {{domxref("Window/fetch", "fetch()")}}, ví dụ, và sau đó đưa vào trang bằng một số DOM scripting. Xem [Thực hiện các yêu cầu mạng bằng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests) và [Giới thiệu DOM scripting](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting) để biết thêm thông tin.

> [!NOTE]
> Nếu bạn kiểm soát nội dung và nó tương đối đơn giản, bạn có thể xem xét sử dụng nội dung được mã hóa base-64 trong thuộc tính `src` để điền vào `<iframe>`, hoặc thậm chí chèn HTML thô vào thuộc tính `srcdoc` (Xem [Iframe Performance Part 2: The Good News](https://medium.com/slices-of-bread/iframe-performance-part-2-the-good-news-26eb53cea429) để biết thêm thông tin).

Nếu bạn phải sử dụng `<iframe>`, thì hãy sử dụng chúng một cách tiết kiệm.

### Tải lười iframe

Theo cách tương tự như các phần tử `<img>`, bạn cũng có thể sử dụng thuộc tính `loading` để hướng dẫn trình duyệt tải lười nội dung `<iframe>` ban đầu nằm ngoài màn hình, từ đó cải thiện hiệu suất:

```html
<iframe src="https://example.com" loading="lazy" width="600" height="400">
</iframe>
```

Xem [Đã đến lúc tải lười offscreen iframe!](https://web.dev/articles/iframe-lazy-loading) để biết thêm thông tin.

## Xử lý thứ tự tải tài nguyên

Thứ tự tải tài nguyên quan trọng để tối đa hóa hiệu suất cảm nhận và thực tế. Khi một trang web được tải:

1. HTML thường được phân tích trước, theo thứ tự xuất hiện trên trang.
2. Bất kỳ CSS nào được tìm thấy sẽ được phân tích để hiểu các kiểu cần được áp dụng cho trang. Trong thời gian này, các tài nguyên được liên kết như hình ảnh và phông chữ web bắt đầu được tải xuống.
3. Bất kỳ JavaScript nào được tìm thấy sẽ được phân tích, đánh giá và chạy trên trang. Theo mặc định, điều này chặn phân tích HTML xuất hiện sau các phần tử {{htmlelement("script")}} nơi JavaScript được gặp.
4. Một chút sau, trình duyệt tính toán cách mỗi phần tử HTML nên được tạo kiểu, dựa trên CSS được áp dụng cho nó.
5. Kết quả được tạo kiểu sau đó được vẽ lên màn hình.

> [!NOTE]
> Đây là một mô tả rất đơn giản hóa về những gì xảy ra, nhưng nó cho bạn ý tưởng.

Các tính năng HTML khác nhau cho phép bạn điều chỉnh cách tải tài nguyên xảy ra để cải thiện hiệu suất. Chúng ta sẽ khám phá một số trong số này ngay bây giờ.

### Xử lý tải JavaScript

Phân tích và thực thi JavaScript chặn phân tích nội dung DOM tiếp theo. Điều này tăng thời gian cho đến khi nội dung đó được kết xuất và có thể sử dụng bởi người dùng của trang. Một tập lệnh nhỏ sẽ không tạo ra nhiều sự khác biệt, nhưng hãy xem xét rằng các ứng dụng web hiện đại có xu hướng rất nặng JavaScript.

Một hiệu ứng phụ khác của hành vi phân tích JavaScript mặc định là, nếu tập lệnh đang được kết xuất phụ thuộc vào nội dung DOM xuất hiện ở cuối trang, bạn sẽ gặp lỗi.

Ví dụ, hãy tưởng tượng một đoạn văn đơn giản trên trang:

```html
<p>My paragraph</p>
```

Bây giờ hãy tưởng tượng một tệp JavaScript chứa mã sau:

```js
const pElem = document.querySelector("p");

pElem.addEventListener("click", () => {
  alert("You clicked the paragraph");
});
```

Chúng ta có thể áp dụng tập lệnh này cho trang bằng cách tham chiếu nó trong phần tử `<script>` như sau:

```html
<script src="index.js"></script>
```

Nếu chúng ta đặt phần tử `<script>` này trước phần tử `<p>` trong thứ tự nguồn (ví dụ, trong phần tử {{htmlelement("head")}}), trang sẽ báo lỗi (Chrome ví dụ báo cáo "Uncaught TypeError: Cannot read properties of null (reading 'addEventListener')" vào console). Điều này xảy ra vì tập lệnh phụ thuộc vào phần tử `<p>` để hoạt động, nhưng tại điểm tập lệnh được phân tích, phần tử `<p>` không tồn tại trên trang. Nó chưa được kết xuất.

Bạn có thể khắc phục vấn đề trên bằng cách đặt phần tử `<script>` sau phần tử `<p>` (ví dụ ở cuối thân tài liệu), hoặc bằng cách chạy mã bên trong trình xử lý sự kiện phù hợp (ví dụ chạy nó trên [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event), kích hoạt khi DOM đã được phân tích hoàn toàn).

Tuy nhiên, điều này không giải quyết vấn đề chờ tập lệnh tải. Hiệu suất tốt hơn có thể đạt được bằng cách thêm thuộc tính `async` vào phần tử `<script>`:

```html
<script async src="index.js"></script>
```

Điều này khiến tập lệnh được tải xuống song song với phân tích DOM, vì vậy nó sẵn sàng cùng lúc, và sẽ không chặn kết xuất, từ đó cải thiện hiệu suất.

> [!NOTE]
> Có một thuộc tính khác, `defer`, khiến tập lệnh được thực thi sau khi tài liệu đã được phân tích, nhưng trước khi kích hoạt `DOMContentLoaded`. Điều này có tác dụng tương tự như `async`.

Một mẹo xử lý tải JavaScript khác là chia tập lệnh của bạn thành các mô-đun mã và tải từng phần khi cần, thay vì đặt tất cả mã vào một tập lệnh khổng lồ và tải tất cả ở đầu. Điều này được thực hiện bằng cách sử dụng [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules). Đọc bài viết được liên kết để có hướng dẫn chi tiết.

### Preloading nội dung với rel="preload"

Việc tải xuống các tài nguyên khác (như hình ảnh, video hoặc tệp phông chữ) được liên kết từ HTML, CSS và JavaScript cũng có thể gây ra các vấn đề về hiệu suất, chặn mã của bạn thực thi và làm chậm trải nghiệm. Một cách để giảm thiểu các vấn đề như vậy là sử dụng `rel="preload"` để biến các phần tử {{htmlelement("link")}} thành preloaders. Ví dụ:

```html
<link rel="preload" href="sintel-short.mp4" as="video" type="video/mp4" />
```

Khi gặp liên kết `rel="preload"`, trình duyệt sẽ tải xuống tài nguyên được tham chiếu càng sớm càng tốt và làm cho nó có sẵn trong bộ nhớ đệm trình duyệt để nó sẵn sàng sử dụng sớm hơn khi nó được tham chiếu trong mã tiếp theo. Hữu ích khi preload các tài nguyên có mức độ ưu tiên cao mà người dùng sẽ gặp sớm trên trang để trải nghiệm càng mượt mà càng tốt.

Xem các bài viết sau để biết thông tin chi tiết về việc sử dụng `rel="preload"`:

- [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload)
- [Preload các tài nguyên quan trọng để cải thiện tốc độ tải](https://web.dev/articles/preload-critical-assets) trên web.dev (2020)

> [!NOTE]
> Bạn cũng có thể sử dụng `rel="preload"` để preload các tệp CSS và JavaScript.

> [!NOTE]
> Có các giá trị [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) khác cũng được thiết kế để tăng tốc các khía cạnh khác nhau của tải trang: `dns-prefetch`, `preconnect`, `modulepreload` và `prefetch`. Truy cập trang được liên kết và tìm hiểu những gì chúng làm.

## Xem thêm

- [Thực hiện các yêu cầu mạng bằng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests)
- [Giới thiệu DOM scripting](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting)

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/JavaScript", "Learn_web_development/Extensions/Performance/CSS", "Learn_web_development/Extensions/Performance")}}
