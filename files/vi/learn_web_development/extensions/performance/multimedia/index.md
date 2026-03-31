---
title: "Đa phương tiện: Hình ảnh"
slug: Learn_web_development/Extensions/Performance/Multimedia
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Measuring_performance", "Learn_web_development/Extensions/Performance/video", "Learn_web_development/Extensions/Performance")}}

Đa phương tiện, cụ thể là hình ảnh và video, chiếm hơn 70% lượng byte được tải xuống cho một trang web trung bình. Về mặt hiệu suất tải xuống, việc loại bỏ đa phương tiện và giảm kích thước tệp là điểm cải thiện dễ đạt nhất. Bài viết này xem xét cách tối ưu hóa hình ảnh và video để cải thiện hiệu suất web.

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
        Tìm hiểu về các định dạng hình ảnh khác nhau, tác động của chúng đến hiệu suất, và cách giảm tác động của hình ảnh đến tổng thời gian tải trang.
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Đây là phần giới thiệu cấp cao về tối ưu hóa việc phân phối đa phương tiện trên web, bao gồm các nguyên tắc và kỹ thuật chung. Để có hướng dẫn chuyên sâu hơn, xem <https://web.dev/learn/images>.

## Tại sao tối ưu hóa đa phương tiện của bạn?

Đối với trang web trung bình, [51% băng thông đến từ hình ảnh, tiếp theo là video ở mức 25%](https://discuss.httparchive.org/t/state-of-the-web-top-image-optimization-strategies/1367), vì vậy có thể nói việc giải quyết và tối ưu hóa nội dung đa phương tiện của bạn là quan trọng.

Bạn cần chú ý đến việc sử dụng dữ liệu. Nhiều người đang sử dụng các gói dữ liệu có giới hạn hoặc thậm chí trả tiền theo mức sử dụng, nơi họ thực sự trả tiền theo megabyte. Đây không chỉ là vấn đề của thị trường mới nổi. Tính đến năm 2018, 24% Vương quốc Anh vẫn sử dụng trả tiền theo mức sử dụng theo [OFCOM Nations & regions technology tracker - H1 2018 (PDF)](https://www.ofcom.org.uk/siteassets/resources/documents/research-and-data/technology-research/technology-tracker/technology-tracker-h1-2018-data-tables?v=323142).

Bạn cũng cần chú ý đến bộ nhớ vì nhiều thiết bị di động có RAM hạn chế. Điều quan trọng cần nhớ là khi hình ảnh được tải xuống, chúng cần được lưu trữ trong bộ nhớ.

## Tối ưu hóa phân phối hình ảnh

Mặc dù là người tiêu thụ băng thông lớn nhất, tác động của việc tải xuống hình ảnh đến [hiệu suất cảm nhận](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance) thấp hơn nhiều so với những gì nhiều người mong đợi (chủ yếu vì nội dung văn bản trang được tải xuống ngay lập tức và người dùng có thể thấy hình ảnh đang được kết xuất khi chúng đến). Tuy nhiên, để có trải nghiệm người dùng tốt, vẫn quan trọng là khách truy cập có thể thấy chúng càng sớm càng tốt.

### Chiến lược tải

Một trong những cải tiến lớn nhất cho hầu hết các trang web là [tải lười](/en-US/docs/Web/Performance/Guides/Lazy_loading) hình ảnh dưới phần gập của trang, thay vì tải xuống tất cả chúng khi tải trang ban đầu bất kể khách truy cập có cuộn xuống để xem chúng hay không. Trình duyệt cung cấp điều này nguyên bản thông qua thuộc tính [`loading="lazy"`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) trên các phần tử `<img>` `<iframe>`, `<video>` và `<audio>`, và cũng có nhiều thư viện JavaScript phía client có thể làm điều này.

Ngoài việc tải một tập hợp con hình ảnh, bạn nên xem xét định dạng của chính các hình ảnh:

- Bạn có đang tải định dạng tệp tối ưu nhất không?
- Bạn đã nén hình ảnh tốt chưa?
- Bạn có đang tải đúng kích thước không?

#### Định dạng tối ưu nhất

Định dạng tệp tối ưu thường phụ thuộc vào đặc tính của hình ảnh.

> [!NOTE]
> Để biết thông tin chung về các loại hình ảnh, xem [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)

Định dạng [SVG](/en-US/docs/Web/Media/Guides/Formats/Image_types#svg_scalable_vector_graphics) phù hợp hơn cho hình ảnh có ít màu sắc và không thực tế về mặt ảnh chụp. Điều này yêu cầu nguồn có sẵn ở định dạng đồ họa vector. Nếu hình ảnh như vậy chỉ tồn tại dưới dạng bitmap, thì [PNG](/en-US/docs/Web/Media/Guides/Formats/Image_types#png_portable_network_graphics) sẽ là định dạng dự phòng để chọn. Ví dụ về các loại motif này là logo, minh họa, biểu đồ hoặc biểu tượng (lưu ý: SVG tốt hơn nhiều so với phông chữ biểu tượng!). Cả hai định dạng đều hỗ trợ độ trong suốt.

PNG có thể được lưu với ba tổ hợp đầu ra khác nhau:

- Màu 24-bit + độ trong suốt 8-bit — cung cấp độ chính xác màu sắc đầy đủ và độ trong suốt mượt mà với chi phí kích thước. Bạn có thể muốn tránh tổ hợp này để sử dụng WebP (xem bên dưới).
- Màu 8-bit + độ trong suốt 8-bit — cung cấp không quá 255 màu nhưng duy trì độ trong suốt mượt mà. Kích thước không quá lớn. Đó là những PNG mà bạn có thể muốn.
- Màu 8-bit + độ trong suốt 1-bit — cung cấp không quá 255 màu và chỉ cung cấp không hoặc toàn độ trong suốt cho mỗi điểm ảnh, điều này khiến các đường viền trong suốt trông cứng và gồ ghề. Kích thước nhỏ nhưng phải trả giá là độ trung thực hình ảnh.

Một công cụ trực tuyến tốt để tối ưu hóa SVG là [SVGOMG](https://jakearchibald.github.io/svgomg/). Đối với PNG có [ImageOptim online](https://imageoptim.com/online) hoặc [Squoosh](https://squoosh.app/).

Với các motif ảnh chụp không có độ trong suốt, có nhiều định dạng hơn để lựa chọn. Nếu bạn muốn an toàn, bạn sẽ chọn **Progressive JPEG** được nén tốt. Progressive JPEG, ngược lại với JPEG thông thường, kết xuất dần dần (do đó có tên), có nghĩa là người dùng thấy phiên bản độ phân giải thấp ngày càng rõ hơn khi hình ảnh tải xuống, thay vì hình ảnh tải từ trên xuống dưới ở độ phân giải đầy đủ hoặc thậm chí chỉ kết xuất sau khi tải xuống hoàn toàn. Một bộ nén tốt cho những cái này sẽ là MozJPEG, ví dụ, có thể sử dụng trong công cụ tối ưu hóa hình ảnh trực tuyến [Squoosh](https://squoosh.app/). Cài đặt chất lượng 75% sẽ cho kết quả tốt.

Các định dạng khác cải thiện khả năng nén của JPEG, nhưng không có sẵn trên mọi trình duyệt:

- [WebP](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image) — Lựa chọn tuyệt vời cho cả hình ảnh tĩnh và hình ảnh động. WebP cung cấp khả năng nén tốt hơn nhiều so với PNG hoặc JPEG với hỗ trợ độ sâu màu cao hơn, khung hình động, độ trong suốt, v.v. (nhưng không hiển thị dần dần). Được hỗ trợ bởi tất cả các trình duyệt chính ngoại trừ Safari 14 trên macOS desktop Big Sur trở về trước.

  > [!NOTE]
  > Mặc dù Apple [công bố hỗ trợ WebP trong Safari 14](https://developer.apple.com/videos/play/wwdc2020/10663/?time=1174), các phiên bản Safari trước 16.0 không hiển thị thành công hình ảnh `.webp` trên các phiên bản macOS desktop trước 11/Big Sur. Safari dành cho iOS 14 _có_ hiển thị thành công hình ảnh `.webp`.

- [AVIF](/en-US/docs/Web/Media/Guides/Formats/Image_types#avif_image) — Lựa chọn tốt cho cả hình ảnh tĩnh và hình ảnh động do hiệu suất cao và định dạng hình ảnh không có tiền bản quyền (thậm chí hiệu quả hơn WebP, nhưng không được hỗ trợ rộng rãi như vậy). Hiện được hỗ trợ trên Chrome, Edge, Opera và Firefox. [Squoosh](https://squoosh.app/) là công cụ trực tuyến tốt để chuyển đổi các định dạng hình ảnh trước đó sang AVIF.
- **JPEG2000** — từng được coi là người kế nhiệm JPEG nhưng chỉ được hỗ trợ trong Safari. Cũng không hỗ trợ hiển thị dần dần.

Do hỗ trợ hẹp cho JPEG-XR và JPEG2000, và cũng tính đến chi phí giải mã vào phương trình, đối thủ duy nhất nghiêm túc cho JPEG là WebP. Đó là lý do tại sao bạn có thể cung cấp hình ảnh của mình theo định dạng đó. Điều này có thể được thực hiện thông qua phần tử `<picture>` với sự trợ giúp của phần tử `<source>` được trang bị [thuộc tính type](/en-US/docs/Web/HTML/Reference/Elements/picture#the_type_attribute).

Nếu tất cả những điều này nghe có vẻ hơi phức tạp hoặc cảm thấy như quá nhiều công việc cho nhóm của bạn, thì cũng có các dịch vụ trực tuyến mà bạn có thể sử dụng như CDN hình ảnh sẽ tự động hóa việc phục vụ đúng định dạng hình ảnh theo thời gian thực, theo loại thiết bị hoặc trình duyệt yêu cầu hình ảnh. Các lựa chọn phổ biến bao gồm [Cloudinary](https://cloudinary.com/blog/make_all_images_on_your_website_responsive_in_3_easy_steps), [Image Engine](https://imageengine.io/), [ImageKit](https://imagekit.io/docs/image-optimization#automatic-format-conversion) và [imgix](https://www.imgix.com/).

Cuối cùng, nếu bạn muốn bao gồm hình ảnh động trên trang của mình, hãy biết rằng Safari cho phép sử dụng tệp video trong các phần tử `<img>` và `<picture>`. Chúng cũng cho phép bạn thêm **Animated WebP** cho tất cả các trình duyệt hiện đại khác.

```html
<picture>
  <source type="video/mp4" src="giphy.mp4" />
  <source type="image/webp" src="giphy.webp" />
  <img src="giphy.gif" alt="A GIF animation" />
</picture>
```

#### Phục vụ đúng kích thước

Trong phân phối hình ảnh, phương pháp "một kích thước phù hợp tất cả" sẽ không cho kết quả tốt nhất, có nghĩa là đối với màn hình nhỏ hơn bạn muốn phục vụ hình ảnh có độ phân giải thấp hơn và ngược lại cho màn hình lớn hơn. Ngoài ra, bạn cũng muốn phục vụ hình ảnh độ phân giải cao hơn cho những thiết bị có màn hình DPI cao (ví dụ như "Retina"). Vì vậy, ngoài việc tạo ra nhiều biến thể hình ảnh trung gian, bạn cũng cần một cách để phục vụ tệp đúng cho đúng trình duyệt. Đó là nơi bạn cần nâng cấp các phần tử `<picture>` và `<source>` của mình với các thuộc tính [`media`](/en-US/docs/Web/HTML/Reference/Elements/source#media) và/hoặc [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/source#sizes). [Responsive images done right: A guide to `<picture>` and `srcset`](https://www.smashingmagazine.com/2014/05/responsive-images-done-right-guide-picture-srcset/) giải thích chi tiết cách kết hợp tất cả các thuộc tính này.

Hai hiệu ứng thú vị cần ghi nhớ liên quan đến màn hình DPI cao là:

- với màn hình DPI cao, con người sẽ phát hiện các artefact nén muộn hơn nhiều, có nghĩa là đối với hình ảnh dành cho các màn hình này, bạn có thể tăng nén cao hơn mức thông thường.
- [Chỉ một số ít người có thể phát hiện sự tăng độ phân giải vượt quá 2× DPI](https://observablehq.com/@eeeps/visual-acuity-and-device-pixel-ratio), có nghĩa là bạn không cần phục vụ hình ảnh có độ phân giải cao hơn 2×.

#### Kiểm soát độ ưu tiên (và thứ tự) tải xuống hình ảnh

Đưa những hình ảnh quan trọng nhất đến với khách truy cập sớm hơn những hình ảnh ít quan trọng hơn có thể mang lại cải thiện hiệu suất cảm nhận.

Điều đầu tiên cần kiểm tra là hình ảnh nội dung của bạn sử dụng các phần tử `<img>` hoặc `<picture>` và hình ảnh nền được định nghĩa trong CSS với `background-image` — hình ảnh được tham chiếu trong các phần tử `<img>` được gán mức độ ưu tiên tải cao hơn hình ảnh nền.

Thứ hai, với việc áp dụng Priority Hints, bạn có thể kiểm soát độ ưu tiên hơn nữa bằng cách thêm thuộc tính `fetchPriority` vào thẻ hình ảnh của bạn. Một ví dụ về trường hợp sử dụng cho priority hints trên hình ảnh là carousel, nơi hình ảnh đầu tiên có độ ưu tiên cao hơn các hình ảnh tiếp theo.

### Chiến lược kết xuất: ngăn ngừa jank khi tải hình ảnh

Vì hình ảnh được tải không đồng bộ và tiếp tục tải sau khi vẽ đầu tiên, nếu kích thước của chúng không được định nghĩa trước khi tải, chúng có thể gây ra tính toán lại bố cục (reflow) cho nội dung trang. Ví dụ, khi văn bản bị đẩy xuống trang bởi hình ảnh đang tải. Vì lý do này, điều quan trọng là đặt thuộc tính `width` và `height` để trình duyệt có thể dành không gian cho chúng trong bố cục.

Khi các thuộc tính `width` và `height` của một hình ảnh được bao gồm trên phần tử HTML {{htmlelement("img")}}, [tỷ lệ khung hình của hình ảnh](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios#adjusting_aspect_ratios_of_replaced_elements) có thể được trình duyệt tính toán trước khi hình ảnh được tải. {{glossary("aspect ratio")}} này được sử dụng để dành không gian cần thiết để hiển thị hình ảnh, giảm hoặc thậm chí ngăn chặn sự dịch chuyển bố cục khi hình ảnh được tải xuống và vẽ lên màn hình. Giảm dịch chuyển bố cục là một thành phần chính của trải nghiệm người dùng tốt và hiệu suất web.

Trình duyệt bắt đầu kết xuất nội dung khi HTML được phân tích, thường trước khi tất cả tài nguyên, bao gồm hình ảnh, được tải xuống. Việc bao gồm kích thước cho phép trình duyệt dành một hộp giữ chỗ có kích thước đúng cho mỗi hình ảnh để hiển thị khi hình ảnh được tải khi kết xuất trang lần đầu tiên.

![Two screenshots the first without an image but with space reserved, the second showing the image loaded into the reserved space.](ar-guide.jpg)

Nếu không có các thuộc tính `width` và `height`, sẽ không có không gian giữ chỗ nào được tạo ra, tạo ra một {{glossary('jank')}} đáng chú ý, hoặc dịch chuyển bố cục, trong trang khi hình ảnh tải sau khi trang được kết xuất. Tính toán lại bố cục và vẽ lại trang là các vấn đề về hiệu suất và khả năng sử dụng.

Số liệu {{glossary("CLS")}} đo jank khi tải trang, hoặc bao nhiêu nội dung hiển thị dịch chuyển trong viewport và bao nhiêu. Những thủ phạm chính của CLS xấu là các phần tử thay thế không có kích thước được khai báo mà tính toán lại bố cục khi tài nguyên tải, bao gồm hình ảnh, quảng cáo, nhúng và iframe không có kích thước hoặc {{cssxref("aspect-ratio")}} và phông chữ web.

Trong thiết kế đáp ứng, khi một vùng chứa hẹp hơn hình ảnh, CSS sau đây thường được sử dụng để ngăn hình ảnh vượt ra ngoài vùng chứa của chúng:

```css
img {
  max-width: 100%;
  height: auto;
}
```

Mặc dù hữu ích cho bố cục đáp ứng, điều này gây ra jank và CLS kém khi thông tin chiều rộng và chiều cao không được bao gồm, vì nếu không có thông tin chiều cao khi phần tử `<img>` được phân tích nhưng trước khi hình ảnh được tải, CSS này thực sự đã đặt chiều cao thành 0. Khi hình ảnh tải sau khi trang đã được kết xuất ban đầu lên màn hình, trang tính toán lại bố cục và vẽ lại tạo ra dịch chuyển bố cục khi nó tạo không gian cho chiều cao mới được xác định.

Trình duyệt có cơ chế để kích thước hình ảnh trước khi hình ảnh thực tế được tải. Khi phần tử `<img>`, `<video>` hoặc `<input type="button">` có các thuộc tính `width` và `height` được đặt trên nó, tỷ lệ khung hình của nó được tính toán trước thời gian tải, và có sẵn cho trình duyệt, sử dụng các kích thước được cung cấp.

Tỷ lệ khung hình sau đó được sử dụng để tính chiều cao, và do đó, kích thước đúng được áp dụng cho phần tử `<img>`, có nghĩa là jank đã đề cập sẽ không xảy ra hoặc tối thiểu nếu các kích thước được liệt kê không hoàn toàn chính xác khi hình ảnh tải.

Tỷ lệ khung hình chỉ được sử dụng để dành không gian khi tải hình ảnh. Khi hình ảnh đã tải, tỷ lệ khung hình nội tại của hình ảnh được tải hoặc giá trị của thuộc tính `aspect-ratio` được sử dụng thay vì tỷ lệ khung hình từ các thuộc tính. Điều này đảm bảo rằng nó hiển thị ở tỷ lệ khung hình đúng ngay cả khi kích thước thuộc tính không chính xác.

Mặc dù các phương pháp hay nhất của nhà phát triển từ thập kỷ trước có thể đã khuyến nghị bỏ qua các thuộc tính `width` và `height` của hình ảnh trên HTML {{htmlelement("img")}}, do ánh xạ tỷ lệ khung hình, việc bao gồm hai thuộc tính này được coi là phương pháp hay nhất của nhà phát triển.

Đối với bất kỳ hình ảnh nền nào, điều quan trọng là bạn đặt giá trị `background-color` để bất kỳ nội dung nào được đặt chồng lên vẫn có thể đọc được trước khi hình ảnh được tải xuống.

## Kết luận

Trong phần này, chúng ta đã xem xét tối ưu hóa hình ảnh. Bây giờ bạn có hiểu biết chung về cách tối ưu hóa một nửa tổng băng thông trung bình của trang web. Đây chỉ là một trong những loại đa phương tiện tiêu thụ băng thông của người dùng và làm chậm thời gian tải trang. Hãy xem tối ưu hóa video, giải quyết 20% tiêu thụ băng thông tiếp theo.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Measuring_performance", "Learn_web_development/Extensions/Performance/video", "Learn_web_development/Extensions/Performance")}}
