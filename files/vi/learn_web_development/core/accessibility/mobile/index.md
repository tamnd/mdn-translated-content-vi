---
title: Khả năng tiếp cận trên thiết bị di động
slug: Learn_web_development/Core/Accessibility/Mobile
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Multimedia","Learn_web_development/Core/Accessibility/Accessibility_troubleshooting", "Learn_web_development/Core/Accessibility")}}

Với việc truy cập web trên thiết bị di động ngày càng phổ biến và các nền tảng nổi tiếng như iOS và Android có đầy đủ các công cụ hỗ trợ khả năng tiếp cận, điều quan trọng là phải xem xét khả năng tiếp cận nội dung web của bạn trên các nền tảng này. Bài viết này xem xét các cân nhắc về khả năng tiếp cận dành riêng cho thiết bị di động.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và các thực hành tốt nhất về khả năng tiếp cận như đã được dạy trong các bài học trước của mô-đun.</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Quen thuộc với trình đọc màn hình trên iOS và Android.</li>
          <li>Quen thuộc với các vấn đề về khả năng tiếp cận đằng sau một số loại sự kiện.</li>
          <li>Các kỹ thuật cụ thể để tạo các cơ chế nhập liệu người dùng dễ sử dụng hơn trên thiết bị di động.</li>
          <li>Biết rằng trình duyệt di động cung cấp các ưu điểm khả dụng cụ thể cho các loại <code>&lt;input&gt;</code> cụ thể như <code>number</code> hoặc <code>tel</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Khả năng tiếp cận trên thiết bị di động

Trạng thái của khả năng tiếp cận — và hỗ trợ cho các tiêu chuẩn web nói chung — tốt trên các thiết bị di động hiện đại. Những ngày khi thiết bị di động chạy các công nghệ web hoàn toàn khác so với trình duyệt máy tính để bàn đã qua rồi, buộc các nhà phát triển sử dụng tính năng nhận diện trình duyệt và phục vụ cho họ các trang web hoàn toàn riêng biệt (mặc dù khá nhiều công ty vẫn phát hiện việc sử dụng thiết bị di động và phục vụ cho họ miền di động riêng biệt).

Ngày nay, các thiết bị di động thường có thể xử lý các trang web đầy đủ tính năng, và các nền tảng chính thậm chí có trình đọc màn hình tích hợp để cho phép người dùng suy giảm thị giác sử dụng thành công. Trình duyệt di động hiện đại cũng có xu hướng hỗ trợ tốt cho [WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics).

Để làm cho trang web dễ tiếp cận và sử dụng được trên thiết bị di động, bạn chỉ cần tuân theo thiết kế web tốt và các thực hành tốt nhất về khả năng tiếp cận chung.

Có một số ngoại lệ cần xem xét đặc biệt cho thiết bị di động; những điều chính là:

- Cơ chế điều khiển — Đảm bảo các điều khiển giao diện như nút có thể tiếp cận trên thiết bị di động (chủ yếu là màn hình cảm ứng), cũng như máy tính để bàn/máy tính xách tay (chủ yếu là chuột/bàn phím).
- Nhập liệu người dùng — Làm cho yêu cầu nhập liệu người dùng ít khó chịu nhất có thể trên thiết bị di động (ví dụ, trong form, giảm thiểu việc gõ phím).
- Thiết kế đáp ứng — Đảm bảo bố cục hoạt động trên thiết bị di động, tiết kiệm kích thước tải xuống hình ảnh, và suy nghĩ về việc cung cấp hình ảnh cho màn hình độ phân giải cao.

## Tóm tắt kiểm tra trình đọc màn hình trên Android và iOS

Các nền tảng di động phổ biến nhất có trình đọc màn hình đầy đủ chức năng. Chúng hoạt động theo cách tương tự như các trình đọc màn hình trên máy tính để bàn, ngoại trừ chúng chủ yếu được vận hành bằng cử chỉ chạm thay vì tổ hợp phím.

Hãy xem xét hai cái chính: TalkBack trên Android và VoiceOver trên iOS.

### Android TalkBack

Trình đọc màn hình TalkBack được tích hợp trong hệ điều hành Android.

Để bật nó, hãy tra cứu mẫu điện thoại và phiên bản Android của bạn, và sau đó tra cứu vị trí menu TalkBack. Nó có xu hướng khác nhau rất nhiều giữa các phiên bản Android và thậm chí giữa các mẫu điện thoại khác nhau. Một số nhà sản xuất điện thoại (ví dụ, Samsung) thậm chí không có TalkBack trong các điện thoại mới hơn, và thay vào đó chọn trình đọc màn hình của riêng họ.

Khi bạn đã tìm thấy menu TalkBack, nhấn nút chuyển đổi trượt để bật TalkBack. Làm theo các lời nhắc trên màn hình bổ sung mà bạn được trình bày.

Khi TalkBack được bật, các điều khiển cơ bản của thiết bị Android của bạn sẽ hơi khác. Ví dụ:

1. Chạm một lần vào ứng dụng sẽ chọn nó, và thiết bị sẽ đọc ra ứng dụng đó là gì.
2. Vuốt sang trái và phải sẽ di chuyển giữa các ứng dụng, hoặc các nút/điều khiển nếu bạn đang ở trong thanh điều khiển. Thiết bị sẽ đọc ra từng tùy chọn.
3. Chạm đúp vào bất kỳ đâu sẽ mở ứng dụng/chọn tùy chọn.
4. Bạn cũng có thể "khám phá bằng cách chạm" — giữ ngón tay trên màn hình và kéo xung quanh, và thiết bị sẽ đọc ra các ứng dụng/mục khác nhau mà bạn di chuyển qua.

Nếu bạn muốn tắt TalkBack:

1. Điều hướng trở lại màn hình menu TalkBack (sử dụng các cử chỉ khác nhau hiện đang được bật.)
2. Điều hướng đến nút chuyển đổi trượt và kích hoạt nó để tắt.

> [!NOTE]
> Bạn có thể đến màn hình chính bất cứ lúc nào bằng cách vuốt lên và sang trái theo chuyển động trơn tru. Nếu bạn có nhiều hơn một màn hình chính, bạn có thể di chuyển giữa chúng bằng cách vuốt hai ngón tay sang trái và phải.

Để có danh sách đầy đủ hơn về các cử chỉ TalkBack, xem [Sử dụng cử chỉ TalkBack](https://support.google.com/accessibility/android/answer/6151827).

#### Mở khóa điện thoại

Khi TalkBack được bật, việc mở khóa điện thoại hơi khác.

Bạn có thể vuốt hai ngón tay lên từ phía dưới màn hình khóa. Nếu bạn đã đặt mã pin hoặc mẫu để mở khóa thiết bị của mình, bạn sẽ được đưa đến màn hình nhập liệu liên quan để nhập nó.

Bạn cũng có thể khám phá bằng cách chạm để tìm nút _Unlock_ ở giữa phía dưới màn hình, và sau đó chạm đúp.

#### Menu toàn cục và cục bộ

TalkBack cho phép bạn truy cập các menu ngữ cảnh toàn cục và cục bộ, bất cứ nơi nào bạn đã điều hướng trên thiết bị. Menu trước cung cấp các tùy chọn toàn cục liên quan đến toàn bộ thiết bị, và menu sau cung cấp các tùy chọn liên quan chỉ đến ứng dụng/màn hình hiện tại bạn đang ở trong.

Để đến các menu này:

1. Truy cập menu toàn cục bằng cách vuốt nhanh xuống, và sau đó sang phải.
2. Truy cập menu cục bộ bằng cách vuốt nhanh lên, và sau đó sang phải.
3. Vuốt sang trái và phải để chuyển qua các tùy chọn khác nhau.
4. Khi bạn đã chọn tùy chọn bạn muốn, chạm đúp để chọn tùy chọn đó.

Để biết chi tiết về tất cả các tùy chọn có sẵn trong menu ngữ cảnh toàn cục và cục bộ, xem [Sử dụng menu ngữ cảnh toàn cục và cục bộ](https://support.google.com/accessibility/android/answer/6007066).

#### Duyệt trang web

Bạn có thể sử dụng menu ngữ cảnh cục bộ trong khi đang ở trình duyệt web để tìm các tùy chọn điều hướng trang web chỉ bằng cách sử dụng tiêu đề, điều khiển form, hoặc liên kết, hoặc điều hướng từng dòng, v.v.

Ví dụ, với TalkBack được bật:

1. Mở trình duyệt web của bạn.
2. Kích hoạt thanh URL.
3. Nhập một trang web có nhiều tiêu đề, chẳng hạn như trang chủ của bbc.co.uk. Để nhập văn bản URL:
   - Chọn thanh URL bằng cách vuốt trái/phải cho đến khi bạn đến nó, và sau đó chạm đúp.
   - Giữ ngón tay trên bàn phím ảo cho đến khi bạn có ký tự bạn muốn, và sau đó nhả ngón tay để gõ. Lặp lại cho mỗi ký tự.
   - Khi bạn đã hoàn thành, tìm phím Enter và nhấn nó.

4. Vuốt sang trái và phải để di chuyển giữa các mục khác nhau trên trang.
5. Vuốt lên và sang phải theo chuyển động trơn tru để vào menu nội dung cục bộ.
6. Vuốt sang phải cho đến khi bạn tìm thấy tùy chọn "Headings and Landmarks".
7. Chạm đúp để chọn nó. Bây giờ bạn sẽ có thể vuốt sang trái và phải để di chuyển giữa các tiêu đề và điểm mốc ARIA.
8. Để quay lại chế độ mặc định, vào lại menu ngữ cảnh cục bộ bằng cách vuốt lên và sang phải, chọn "Default", và sau đó chạm đúp để kích hoạt.

> [!NOTE]
> Xem [Bắt đầu trên Android với TalkBack](https://support.google.com/accessibility/android/answer/6283677?hl=en&ref_topic=3529932) để có tài liệu đầy đủ hơn.

### iOS VoiceOver

Phiên bản di động của VoiceOver được tích hợp trong hệ điều hành iOS.

Để bật nó, hãy vào ứng dụng _Settings_ của bạn và chọn _Accessibility > VoiceOver_. Nhấn thanh trượt _VoiceOver_ để bật nó (bạn cũng sẽ thấy một số tùy chọn khác liên quan đến VoiceOver trên trang này).

> [!NOTE]
> Một số thiết bị iOS cũ hơn có menu VoiceOver tại _Settings app_ > _General_ > _Accessibility_ > _VoiceOver_.

Khi VoiceOver được bật, các cử chỉ điều khiển cơ bản của iOS sẽ hơi khác:

1. Chạm một lần sẽ khiến mục bạn chạm vào được chọn; thiết bị của bạn sẽ đọc mục bạn đã chạm vào.
2. Bạn cũng có thể điều hướng các mục trên màn hình bằng cách vuốt sang trái và phải để di chuyển giữa chúng, hoặc trượt ngón tay xung quanh màn hình để di chuyển giữa các mục khác nhau (khi bạn tìm thấy mục bạn muốn, bạn có thể nhả ngón tay để chọn nó).
3. Để kích hoạt mục đã chọn (ví dụ, mở ứng dụng đã chọn), chạm đúp vào bất kỳ đâu trên màn hình.
4. Vuốt ba ngón tay để cuộn qua một trang.
5. Chạm hai ngón tay để thực hiện hành động theo ngữ cảnh — ví dụ, chụp ảnh khi đang ở trong ứng dụng camera.

Để tắt lại, điều hướng trở lại _Settings > General > Accessibility > VoiceOver_ bằng các cử chỉ trên và chuyển thanh trượt _VoiceOver_ trở lại tắt.

#### Mở khóa điện thoại

Để mở khóa điện thoại, bạn cần nhấn nút home (hoặc vuốt) như bình thường. Nếu bạn đã đặt mã pin, bạn có thể chọn từng số bằng cách vuốt/trượt (như đã giải thích ở trên) và sau đó chạm đúp để nhập từng số khi bạn đã tìm thấy số đúng.

#### Sử dụng Rotor

Khi VoiceOver được bật, bạn có một tính năng điều hướng gọi là Rotor, cho phép bạn nhanh chóng chọn từ một số tùy chọn hữu ích phổ biến. Để sử dụng nó:

1. Xoay hai ngón tay xung quanh màn hình như thể bạn đang quay một núm vặn. Mỗi tùy chọn sẽ được đọc to khi bạn xoay thêm. Bạn có thể đi qua lại để chuyển qua các tùy chọn.
2. Khi bạn đã tìm thấy tùy chọn bạn muốn:
   - Nhả ngón tay để chọn nó.
   - Nếu đó là tùy chọn bạn có thể lặp qua giá trị (như Âm lượng hoặc Tốc độ đọc), bạn có thể vuốt lên hoặc xuống để tăng hoặc giảm giá trị của mục đã chọn.

Các tùy chọn có sẵn trong Rotor phụ thuộc vào ngữ cảnh — chúng sẽ khác nhau tùy thuộc vào ứng dụng hoặc chế độ xem bạn đang ở (xem bên dưới để biết ví dụ).

#### Duyệt trang web

Hãy thử duyệt web với VoiceOver:

1. Mở trình duyệt web của bạn.
2. Kích hoạt thanh URL.
3. Nhập một trang web có nhiều tiêu đề, chẳng hạn như trang chủ của bbc.co.uk. Để nhập văn bản URL:
   - Chọn thanh URL bằng cách vuốt trái/phải cho đến khi bạn đến nó, và sau đó chạm đúp.
   - Với mỗi ký tự, giữ ngón tay trên bàn phím ảo cho đến khi bạn có ký tự bạn muốn, và sau đó nhả ngón tay để chọn nó. Chạm đúp để gõ nó.
   - Khi bạn đã hoàn thành, tìm phím Enter và nhấn nó.

4. Vuốt sang trái và phải để di chuyển giữa các mục trên trang. Bạn có thể chạm đúp vào một mục để chọn nó (ví dụ, theo liên kết).
5. Theo mặc định, tùy chọn Rotor đã chọn sẽ là Tốc độ đọc; bạn hiện có thể vuốt lên và xuống để tăng hoặc giảm tốc độ đọc.
6. Bây giờ xoay hai ngón tay xung quanh màn hình như một núm vặn để hiển thị rotor và di chuyển giữa các tùy chọn của nó. Dưới đây là một vài ví dụ về các tùy chọn có sẵn:
   - _Speaking Rate_: Thay đổi tốc độ đọc.
   - _Containers_: Di chuyển giữa các container ngữ nghĩa khác nhau trên trang.
   - _Headings_: Di chuyển giữa các tiêu đề trên trang.
   - _Links_: Di chuyển giữa các liên kết trên trang.
   - _Form Controls_: Di chuyển giữa các điều khiển form trên trang.
   - _Language_: Di chuyển giữa các bản dịch khác nhau, nếu có sẵn.

7. Chọn _Headings_. Bây giờ bạn sẽ có thể vuốt lên và xuống để di chuyển giữa các tiêu đề trên trang.

> [!NOTE]
> Để có tài liệu tham khảo đầy đủ hơn về các cử chỉ VoiceOver có sẵn và các gợi ý khác về kiểm tra khả năng tiếp cận trên iOS, xem [Tài liệu VoiceOver của Apple](https://developer.apple.com/documentation/accessibility/voiceover/).

## Cơ chế điều khiển

Trong bài viết về khả năng tiếp cận CSS và JavaScript, chúng ta đã xem xét ý tưởng về các sự kiện dành riêng cho một loại cơ chế điều khiển nhất định (xem [Sự kiện dành riêng cho chuột](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#mouse-specific_events)). Tóm lại, những điều này gây ra các vấn đề về khả năng tiếp cận vì các cơ chế điều khiển khác không thể kích hoạt chức năng liên quan.

Ví dụ, sự kiện [click](/en-US/docs/Web/API/Element/click_event) tốt về mặt khả năng tiếp cận — một bộ xử lý sự kiện liên quan có thể được gọi bằng cách nhấp vào phần tử mà bộ xử lý được đặt, tab đến nó và nhấn Enter/Return, hoặc chạm vào nó trên thiết bị màn hình cảm ứng. Hãy thử ví dụ [simple-button-example.html](https://github.com/mdn/learning-area/blob/main/accessibility/mobile/simple-button-example.html) của chúng ta ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/accessibility/mobile/simple-button-example.html)) để xem ý chúng ta muốn nói.

Ngoài ra, các sự kiện dành riêng cho chuột như [mousedown](/en-US/docs/Web/API/Element/mousedown_event) và [mouseup](/en-US/docs/Web/API/Element/mouseup_event) tạo ra vấn đề — các bộ xử lý sự kiện của chúng không thể được gọi bằng các điều khiển không phải chuột.

Nếu bạn cố gắng điều khiển ví dụ [simple-box-drag.html](https://github.com/mdn/learning-area/blob/main/accessibility/mobile/simple-box-drag.html) ([xem ví dụ trực tiếp](https://mdn.github.io/learning-area/accessibility/mobile/simple-box-drag.html)) của chúng ta bằng bàn phím hoặc chạm, bạn sẽ thấy vấn đề. Điều này xảy ra vì chúng ta đang sử dụng code như sau:

```js
div.onmousedown = () => {
  initialBoxX = div.offsetLeft;
  initialBoxY = div.offsetTop;
  movePanel();
};

document.onmouseup = stopMove;
```

Để cho phép các hình thức điều khiển khác, bạn cần sử dụng các sự kiện khác nhau nhưng tương đương — ví dụ, các sự kiện chạm hoạt động trên thiết bị màn hình cảm ứng:

```js
div.ontouchstart = (e) => {
  initialBoxX = div.offsetLeft;
  initialBoxY = div.offsetTop;
  positionHandler(e);
  movePanel();
};

panel.ontouchend = stopMove;
```

Chúng ta đã cung cấp một ví dụ đơn giản cho thấy cách sử dụng các sự kiện chuột và chạm cùng nhau — xem [multi-control-box-drag.html](https://github.com/mdn/learning-area/blob/main/accessibility/mobile/multi-control-box-drag.html) ([xem ví dụ trực tiếp](https://mdn.github.io/learning-area/accessibility/mobile/multi-control-box-drag.html) cũng).

> [!NOTE]
> Bạn cũng có thể xem các ví dụ đầy đủ chức năng cho thấy cách triển khai các cơ chế điều khiển khác nhau tại [Triển khai các cơ chế điều khiển trò chơi](/en-US/docs/Games/Techniques/Control_mechanisms).

## Thiết kế đáp ứng

[Thiết kế đáp ứng](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design) là thực hành làm cho bố cục và các tính năng khác của ứng dụng của bạn thay đổi động tùy thuộc vào các yếu tố như kích thước màn hình và độ phân giải, để chúng có thể sử dụng và dễ tiếp cận với người dùng của các loại thiết bị khác nhau.

Đặc biệt, các vấn đề phổ biến nhất cần được giải quyết cho thiết bị di động là:

- Tính phù hợp của bố cục cho thiết bị di động. Bố cục nhiều cột sẽ không hoạt động tốt trên màn hình hẹp, ví dụ, và kích thước văn bản có thể cần được tăng lên để có thể đọc được. Những vấn đề này có thể được giải quyết bằng cách tạo bố cục đáp ứng sử dụng các công nghệ như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries), [viewport](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport), và [flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox).
- Tiết kiệm kích thước hình ảnh tải xuống. Nói chung, các thiết bị màn hình nhỏ sẽ không cần hình ảnh lớn như các phiên bản máy tính để bàn của chúng, và chúng có nhiều khả năng kết nối mạng chậm hơn. Do đó, việc phục vụ các hình ảnh nhỏ hơn cho các thiết bị màn hình hẹp là khôn ngoan khi thích hợp. Bạn có thể xử lý điều này bằng [kỹ thuật hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images).
- Suy nghĩ về độ phân giải cao. Nhiều thiết bị di động có màn hình độ phân giải cao, và do đó cần hình ảnh độ phân giải cao hơn để màn hình có thể tiếp tục trông sắc nét. Một lần nữa, bạn có thể phục vụ hình ảnh thích hợp bằng kỹ thuật hình ảnh đáp ứng. Ngoài ra, nhiều yêu cầu hình ảnh có thể được đáp ứng bằng cách sử dụng định dạng hình ảnh vector SVG, được hỗ trợ tốt trên các trình duyệt ngày nay. SVG có kích thước tệp nhỏ và sẽ vẫn sắc nét bất kể kích thước nào đang được hiển thị (xem [Bao gồm đồ họa vector trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Including_vector_graphics_in_HTML) để biết thêm chi tiết).

> [!NOTE]
> Chúng ta sẽ không cung cấp thảo luận đầy đủ về các kỹ thuật thiết kế đáp ứng ở đây, vì chúng được đề cập ở các nơi khác trên MDN (xem các liên kết trên).

### Các cân nhắc dành riêng cho thiết bị di động

Có các vấn đề quan trọng khác cần xem xét khi làm cho trang web dễ tiếp cận hơn trên thiết bị di động. Chúng ta đã liệt kê một số ở đây, nhưng sẽ thêm nhiều hơn khi chúng ta nghĩ ra.

#### Không vô hiệu hóa thu phóng

Sử dụng [viewport](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport), có thể vô hiệu hóa thu phóng. Luôn đảm bảo rằng thay đổi kích thước được bật, và đặt chiều rộng thành chiều rộng thiết bị trong {{htmlelement("head")}}:

```html
<meta name="viewport" content="width=device-width; user-scalable=yes" />
```

Bạn không bao giờ nên đặt `user-scalable=no` nếu có thể — nhiều người dựa vào thu phóng để có thể xem nội dung trang web của bạn, vì vậy việc lấy đi chức năng này là một ý tưởng rất tệ. Có những tình huống nhất định mà thu phóng có thể phá vỡ giao diện; trong những trường hợp như vậy, nếu bạn cảm thấy cần vô hiệu hóa thu phóng, bạn nên cung cấp một loại tương đương khác, chẳng hạn như điều khiển để tăng kích thước văn bản theo cách không phá vỡ giao diện của bạn.

#### Giữ cho menu dễ tiếp cận

Vì màn hình hẹp hơn rất nhiều trên thiết bị di động, rất phổ biến khi sử dụng media queries và các công nghệ khác để làm cho menu điều hướng thu nhỏ xuống thành một biểu tượng nhỏ ở đầu màn hình — có thể được nhấn để hiển thị menu chỉ khi cần — khi trang web được xem trên thiết bị di động. Điều này thường được biểu diễn bằng biểu tượng "ba đường ngang", và mẫu thiết kế do đó được gọi là "menu hamburger".

Khi triển khai một menu như vậy, bạn cần đảm bảo rằng điều khiển để hiển thị nó có thể tiếp cận bởi các cơ chế điều khiển thích hợp (thường là chạm cho thiết bị di động), như đã thảo luận trong [Cơ chế điều khiển](#control_mechanisms) ở trên, và phần còn lại của trang được di chuyển ra khỏi đường hoặc ẩn đi theo cách nào đó trong khi menu đang được truy cập, để tránh nhầm lẫn khi điều hướng nó.

Nhấp vào đây để xem [ví dụ menu hamburger tốt](https://fritz-weisshart.de/meg_men/).

## Nhập liệu người dùng

Trên thiết bị di động, việc nhập dữ liệu có xu hướng khó chịu hơn cho người dùng so với trải nghiệm tương đương trên máy tính để bàn. Gõ văn bản vào các đầu vào form bằng bàn phím máy tính để bàn hoặc máy tính xách tay thuận tiện hơn so với bàn phím ảo màn hình cảm ứng hoặc bàn phím vật lý di động nhỏ.

Vì lý do này, đáng để cố gắng giảm thiểu lượng gõ cần thiết. Ví dụ, thay vì yêu cầu người dùng điền chức danh công việc của họ mỗi lần bằng cách sử dụng đầu vào văn bản thông thường, bạn có thể thay vào đó cung cấp menu {{htmlelement("select")}} chứa các tùy chọn phổ biến nhất (cũng giúp đảm bảo tính nhất quán trong nhập dữ liệu) và cung cấp tùy chọn "Khác" để hiển thị trường văn bản để gõ bất kỳ giá trị ngoại lệ nào. Bạn có thể xem ví dụ đơn giản về ý tưởng này trong [common-job-types.html](https://github.com/mdn/learning-area/blob/main/accessibility/mobile/common-job-types.html) (xem [ví dụ công việc phổ biến trực tiếp](https://mdn.github.io/learning-area/accessibility/mobile/common-job-types.html)).

Cũng đáng xem xét việc sử dụng các loại đầu vào form HTML như ngày tháng trên các nền tảng di động vì chúng xử lý chúng tốt — cả Android và iOS, ví dụ, hiển thị các widget có thể sử dụng phù hợp với trải nghiệm thiết bị. Xem [html5-form-examples.html](https://github.com/mdn/learning-area/blob/main/accessibility/mobile/html5-form-examples.html) để biết một số ví dụ (xem [ví dụ form HTML5 trực tiếp](https://mdn.github.io/learning-area/accessibility/mobile/html5-form-examples.html)) — thử tải các ví dụ này và thao tác chúng trên thiết bị di động. Ví dụ:

- Các loại `number`, `tel`, và `email` hiển thị bàn phím ảo phù hợp để nhập số/số điện thoại.
- Các loại `time` và `date` hiển thị các bộ chọn phù hợp để chọn thời gian và ngày tháng.

Nếu bạn muốn cung cấp giải pháp khác cho máy tính để bàn, bạn luôn có thể phục vụ đánh dấu khác nhau cho thiết bị di động của mình bằng cách sử dụng phát hiện tính năng. Xem [bài viết phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) của chúng ta để biết thêm thông tin.

## Tóm tắt

Trong bài viết này, chúng ta đã cung cấp cho bạn một số chi tiết về các vấn đề về khả năng tiếp cận dành riêng cho thiết bị di động phổ biến và cách vượt qua chúng. Chúng ta cũng đã hướng dẫn bạn cách sử dụng các trình đọc màn hình phổ biến nhất để hỗ trợ bạn trong kiểm tra khả năng tiếp cận.

## Xem thêm

- [Hướng dẫn cho phát triển web di động](https://www.smashingmagazine.com/2012/07/guidelines-for-mobile-web-development/) — Danh sách các bài viết trong _Smashing Magazine_ đề cập các kỹ thuật khác nhau cho thiết kế web di động.
- [Làm cho trang web của bạn hoạt động trên thiết bị cảm ứng](https://www.creativebloq.com/javascript/make-your-site-work-touch-devices-51411644) — Bài viết hữu ích về việc sử dụng sự kiện chạm để tương tác hoạt động trên thiết bị di động.

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Multimedia","Learn_web_development/Core/Accessibility/Accessibility_troubleshooting", "Learn_web_development/Core/Accessibility")}}
