---
title: Sử dụng hình ảnh responsive trong HTML
short-title: Hình ảnh responsive
slug: Web/HTML/Guides/Responsive_images
page-type: guide
sidebar: htmlsidebar
---

Trong bài viết này, chúng ta sẽ tìm hiểu về khái niệm hình ảnh responsive — những hình ảnh hoạt động tốt trên các thiết bị có kích thước màn hình, độ phân giải và các đặc điểm khác nhau rất đa dạng — và xem HTML cung cấp những công cụ nào để triển khai chúng. Điều này giúp cải thiện hiệu suất trên nhiều loại thiết bị khác nhau.

## Tại sao cần hình ảnh responsive?

Hãy xem xét một tình huống điển hình. Một trang web thông thường có thể chứa một hình ảnh tiêu đề và một số hình ảnh nội dung bên dưới tiêu đề. Hình ảnh tiêu đề thường trải rộng toàn bộ chiều rộng của phần header, còn hình ảnh nội dung sẽ nằm gọn trong cột nội dung. Đây là một ví dụ:

![Trang web mẫu của chúng ta khi xem trên màn hình rộng - ở đây hình ảnh đầu tiên hiển thị tốt vì nó đủ lớn để nhìn thấy chi tiết ở giữa.](picture-element-wide.png)

Trang web hiển thị tốt trên thiết bị màn hình rộng, chẳng hạn như laptop hoặc máy tính để bàn (bạn có thể [xem ví dụ trực tiếp](https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/not-responsive.html) và tìm [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/responsive-images/not-responsive.html) trên GitHub). Chúng ta sẽ không thảo luận nhiều về CSS trong bài học này, chỉ cần biết rằng:

- Nội dung body được đặt chiều rộng tối đa là 1200 pixel — ở các viewport rộng hơn mức đó, phần body vẫn giữ nguyên 1200px và tự căn giữa trong khoảng trống còn lại. Ở các viewport hẹp hơn, phần body sẽ giữ nguyên 100% chiều rộng viewport.
- Hình ảnh tiêu đề được thiết lập sao cho tâm của nó luôn nằm ở giữa phần header, bất kể chiều rộng của heading là bao nhiêu. Nếu trang web được xem trên màn hình hẹp hơn, các chi tiết quan trọng ở giữa ảnh (những người trong ảnh) vẫn có thể nhìn thấy được, và phần thừa hai bên sẽ bị cắt đi. Ảnh có chiều cao 200px.
- Các hình ảnh nội dung được thiết lập sao cho nếu phần tử body trở nên nhỏ hơn kích thước ảnh, các ảnh bắt đầu co lại để luôn nằm trong phần body thay vì tràn ra ngoài.

Tuy nhiên, vấn đề nảy sinh khi bạn bắt đầu xem trang web trên thiết bị màn hình hẹp. Phần header bên dưới trông ổn, nhưng nó đang chiếm nhiều chiều cao màn hình trên thiết bị di động. Và ở kích thước này, khó có thể nhìn thấy khuôn mặt của hai người trong hình ảnh nội dung đầu tiên.

![Trang web mẫu của chúng ta khi xem trên màn hình hẹp; hình ảnh đầu tiên đã co lại đến mức khó nhận ra các chi tiết trong đó.](non-responsive-narrow.png)

Một cách cải thiện là hiển thị phiên bản hình ảnh được cắt xén, chỉ hiển thị các chi tiết quan trọng khi trang web được xem trên màn hình hẹp. Một hình ảnh được cắt xén thứ hai có thể được hiển thị cho thiết bị màn hình trung bình, như máy tính bảng. Vấn đề chung trong đó bạn muốn phục vụ các hình ảnh được cắt xén khác nhau theo các cách đó, cho các bố cục khác nhau, thường được gọi là **vấn đề định hướng nghệ thuật (art direction problem)**.

Ngoài ra, không cần nhúng những hình ảnh lớn như vậy vào trang nếu nó đang được xem trên màn hình di động. Làm như vậy có thể lãng phí băng thông; đặc biệt, người dùng di động không muốn lãng phí băng thông khi tải xuống một hình ảnh lớn dành cho người dùng máy tính để bàn, trong khi một hình ảnh nhỏ là đủ cho thiết bị của họ. Ngược lại, một [ảnh raster](/en-US/docs/Glossary/Raster_image) nhỏ bắt đầu trông bị vỡ hạt khi hiển thị lớn hơn kích thước gốc của nó (ảnh raster có số pixel chiều rộng và số pixel chiều cao cố định). Lý tưởng nhất là có nhiều độ phân giải sẵn có cho trình duyệt web của người dùng. Trình duyệt sau đó có thể xác định độ phân giải tối ưu để tải dựa trên kích thước màn hình của thiết bị người dùng. Đây được gọi là **vấn đề chuyển đổi độ phân giải (resolution switching problem)**.

Để làm phức tạp hơn, một số thiết bị có màn hình độ phân giải cao cần hình ảnh lớn hơn bạn có thể nghĩ để hiển thị đẹp. Đây về cơ bản là cùng một vấn đề, nhưng trong một ngữ cảnh hơi khác.

Bạn có thể nghĩ rằng hình ảnh vector sẽ giải quyết những vấn đề này, và chúng có phần nào đó giải quyết được — chúng có kích thước file nhỏ và co giãn tốt, và bạn nên sử dụng chúng bất cứ khi nào có thể. Tuy nhiên, chúng không phù hợp với tất cả các loại hình ảnh. Hình ảnh vector rất tuyệt vời cho đồ họa đơn giản, hoa văn, các phần tử giao diện, v.v., nhưng bắt đầu trở nên rất phức tạp khi tạo hình ảnh dựa trên vector với loại chi tiết mà bạn sẽ tìm thấy trong, chẳng hạn như ảnh chụp. Các định dạng ảnh raster như JPEG phù hợp hơn với loại hình ảnh chúng ta thấy trong ví dụ trên.

Loại vấn đề này không tồn tại khi web mới ra đời, vào đầu đến giữa những năm 90 — lúc đó thiết bị duy nhất để duyệt Web là máy tính để bàn và laptop, vì vậy các kỹ sư trình duyệt và người viết đặc tả thậm chí không nghĩ đến việc triển khai các giải pháp. _Các công nghệ hình ảnh responsive_ đã được triển khai gần đây để giải quyết các vấn đề được chỉ ra ở trên bằng cách cho phép bạn cung cấp cho trình duyệt nhiều file hình ảnh, hoặc tất cả hiển thị cùng một thứ nhưng chứa số pixel khác nhau (_resolution switching_), hoặc các hình ảnh khác nhau phù hợp với các phân bổ không gian khác nhau (_art direction_).

> [!NOTE]
> Các tính năng mới được thảo luận trong bài viết này — [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset)/[`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes)/{{htmlelement("picture")}} — đều được hỗ trợ trong các trình duyệt máy tính để bàn và di động hiện đại.

## Làm thế nào để tạo hình ảnh responsive?

Trong phần này, chúng ta sẽ xem xét hai vấn đề được minh họa ở trên và chỉ ra cách giải quyết chúng bằng các tính năng hình ảnh responsive của HTML. Bạn nên lưu ý rằng chúng ta sẽ tập trung vào các phần tử {{htmlelement("img")}} trong phần này, như được thấy trong khu vực nội dung của ví dụ trên — hình ảnh trong tiêu đề trang web chỉ để trang trí, và do đó được triển khai bằng cách sử dụng hình ảnh nền CSS. [CSS có lẽ có các công cụ tốt hơn cho thiết kế responsive](https://cloudfour.com/thinks/responsive-images-101-part-8-css-images/) hơn HTML, và chúng ta sẽ nói về những điều đó trong một module CSS trong tương lai.

### Chuyển đổi độ phân giải: Kích thước khác nhau

Vậy, vấn đề chúng ta muốn giải quyết với việc chuyển đổi độ phân giải là gì? Chúng ta muốn hiển thị nội dung hình ảnh giống hệt nhau, chỉ lớn hơn hoặc nhỏ hơn tùy thuộc vào thiết bị — đây là tình huống chúng ta có với hình ảnh nội dung thứ hai trong ví dụ của mình. Phần tử {{htmlelement("img")}} tiêu chuẩn theo truyền thống chỉ cho phép bạn trỏ trình duyệt đến một file nguồn duy nhất:

```html
<img src="elva-fairy-800w.jpg" alt="Elva dressed as a fairy" />
```

Tuy nhiên, chúng ta có thể sử dụng hai thuộc tính — [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) và [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) — để cung cấp thêm nhiều hình ảnh nguồn cùng với các gợi ý giúp trình duyệt chọn đúng hình. Bạn có thể xem ví dụ về điều này trong ví dụ [responsive.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/responsive.html) của chúng ta trên GitHub (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/responsive-images/responsive.html)):

```html
<img
  srcset="elva-fairy-480w.jpg 480w, elva-fairy-800w.jpg 800w"
  sizes="(width <= 600px) 480px,
         800px"
  src="elva-fairy-800w.jpg"
  alt="Elva dressed as a fairy" />
```

Các thuộc tính `srcset` và `sizes` trông có vẻ phức tạp, nhưng chúng không quá khó hiểu nếu bạn định dạng chúng như trên, với từng phần của giá trị thuộc tính trên mỗi dòng. Mỗi giá trị chứa một danh sách phân cách bằng dấu phẩy, và mỗi phần trong các danh sách đó được tạo thành từ ba phần phụ. Hãy cùng xem qua nội dung của từng phần:

**`srcset`** định nghĩa tập hợp các hình ảnh mà chúng ta sẽ cho phép trình duyệt lựa chọn, và kích thước của mỗi hình ảnh. Mỗi bộ thông tin hình ảnh được phân cách với bộ trước đó bằng dấu phẩy. Với mỗi bộ, chúng ta viết:

1. Một **tên file hình ảnh** (`elva-fairy-480w.jpg`)
2. Một khoảng trắng
3. **Chiều rộng nội tại của hình ảnh tính bằng pixel** (`480w`) — lưu ý rằng đây sử dụng đơn vị `w`, không phải `px` như bạn có thể mong đợi. [Kích thước nội tại](/en-US/docs/Glossary/Intrinsic_Size) của hình ảnh là kích thước thực của nó, có thể được tìm thấy bằng cách kiểm tra file hình ảnh trên máy tính của bạn (ví dụ, trên Mac bạn có thể chọn hình ảnh trong Finder và nhấn <kbd>Cmd</kbd> + <kbd>I</kbd> để hiển thị màn hình thông tin).

**`sizes`** định nghĩa một tập hợp các điều kiện media (ví dụ: chiều rộng màn hình) và chỉ ra kích thước hình ảnh nào sẽ là tốt nhất để chọn, khi một số điều kiện media nhất định là đúng — đây là những gợi ý chúng ta đã nói ở trên. Trong trường hợp này, trước mỗi dấu phẩy chúng ta viết:

1. Một **điều kiện media** (`(width <= 600px)`) — bạn sẽ tìm hiểu thêm về chúng trong [chủ đề CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), nhưng bây giờ hãy chỉ nói rằng một điều kiện media mô tả một trạng thái có thể có của màn hình. Trong trường hợp này, chúng ta đang nói "khi chiều rộng viewport là 600 pixel hoặc ít hơn".
2. Một khoảng trắng
3. **Chiều rộng của vị trí** hình ảnh sẽ lấp đầy khi điều kiện media là đúng (`480px`)

> [!NOTE]
> Trong `sizes`, bạn có thể sử dụng bất kỳ [giá trị độ dài](/en-US/docs/Web/CSS/Reference/Values/length) nào. Ví dụ, thay vì cung cấp chiều rộng tuyệt đối (ví dụ: `480px`), bạn có thể cung cấp chiều rộng tương đối so với viewport (ví dụ: `50vw`). Tuy nhiên, bạn không thể sử dụng phần trăm làm chiều rộng vị trí. Bạn có thể nhận thấy rằng chiều rộng vị trí cuối cùng không có điều kiện media (đây là mặc định được chọn khi không có điều kiện media nào là đúng). Trình duyệt bỏ qua mọi thứ sau điều kiện khớp đầu tiên, vì vậy hãy cẩn thận về cách bạn sắp xếp thứ tự các điều kiện media.

Vậy, với các thuộc tính này được đặt đúng chỗ, trình duyệt sẽ:

1. Xem xét kích thước màn hình, mật độ pixel, mức zoom, hướng màn hình và tốc độ mạng.
2. Xác định điều kiện media nào trong danh sách `sizes` là điều kiện đầu tiên đúng.
3. Xem xét kích thước vị trí được giao cho truy vấn media đó.
4. Tải hình ảnh được tham chiếu trong danh sách `srcset` có cùng kích thước với vị trí. Nếu không có kết quả khớp chính xác với kích thước hiển thị, trình duyệt sẽ chọn hình ảnh đầu tiên lớn hơn kích thước vị trí đã chọn và thu nhỏ nó cho vừa.

Và thế là xong! Lúc này, nếu một trình duyệt hỗ trợ với chiều rộng viewport 480px tải trang, điều kiện media `(width <= 600px)` sẽ đúng, và do đó trình duyệt chọn vị trí `480px`. `elva-fairy-480w.jpg` sẽ được tải, vì chiều rộng nội tại của nó (`480w`) gần nhất với kích thước vị trí. Hình ảnh 800px có dung lượng 128KB trên đĩa, trong khi phiên bản 480px chỉ có 63KB — tiết kiệm được 65KB. Bây giờ, hãy tưởng tượng nếu đây là một trang có nhiều hình ảnh. Sử dụng kỹ thuật này có thể tiết kiệm rất nhiều băng thông cho người dùng di động.

> [!NOTE]
> Khi kiểm tra điều này với trình duyệt máy tính để bàn, nếu trình duyệt không tải các hình ảnh hẹp hơn khi bạn đặt cửa sổ ở chiều rộng hẹp nhất, hãy xem viewport là bao nhiêu (bạn có thể ước tính bằng cách vào bảng điều khiển JavaScript của trình duyệt và gõ `document.querySelector('html').clientWidth`). Các trình duyệt khác nhau có kích thước tối thiểu mà chúng cho phép bạn giảm chiều rộng cửa sổ, và chúng có thể rộng hơn bạn nghĩ. Khi kiểm tra với trình duyệt di động, bạn có thể sử dụng các công cụ như trang `about:debugging` của Firefox để kiểm tra trang được tải trên thiết bị di động bằng các công cụ dành cho nhà phát triển trên máy tính để bàn.
>
> Để xem hình ảnh nào được tải, bạn có thể sử dụng tab [Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) trong Firefox DevTools hoặc bảng [Network](https://developer.chrome.com/docs/devtools/network/) trong Chrome DevTools. Đối với Chrome, bạn cũng có thể muốn [vô hiệu hóa bộ nhớ đệm](https://stackoverflow.com/a/7000899/13725861) để ngăn trình duyệt chọn các hình ảnh đã tải xuống.

Các trình duyệt cũ không hỗ trợ các tính năng này sẽ bỏ qua chúng. Thay vào đó, những trình duyệt đó sẽ tiến hành tải hình ảnh được tham chiếu trong thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) như bình thường.

> [!NOTE]
> Trong phần {{htmlelement("head")}} của ví dụ được liên kết ở trên, bạn sẽ tìm thấy dòng `<meta name="viewport" content="width=device-width">`: điều này buộc các trình duyệt di động áp dụng chiều rộng viewport thực tế của chúng để tải các trang web (một số trình duyệt di động giả mạo về chiều rộng viewport của họ, và thay vào đó tải các trang ở chiều rộng viewport lớn hơn rồi thu nhỏ trang đã tải xuống, điều này không hữu ích cho hình ảnh hoặc thiết kế responsive).

### Chuyển đổi độ phân giải: Cùng kích thước, độ phân giải khác nhau

Giả sử bạn có một hình ảnh sẽ được hiển thị cùng kích thước thực tế trên các màn hình có độ phân giải màn hình khác nhau. Bạn có thể mang lại trải nghiệm người dùng tốt hơn trên các màn hình độ phân giải cao bằng cách phục vụ phiên bản hình ảnh có độ phân giải cao hơn.

Để đạt được điều này, bạn có thể cho phép trình duyệt chọn hình ảnh có độ phân giải thích hợp bằng cách sử dụng `srcset` với các mô tả x và không có `sizes` — cú pháp đơn giản hơn một chút! Bạn có thể tìm thấy ví dụ về điều này trong [srcset-resolutions.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/srcset-resolutions.html) (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/responsive-images/srcset-resolutions.html)):

```html
<img
  srcset="elva-fairy-320w.jpg, elva-fairy-480w.jpg 1.5x, elva-fairy-640w.jpg 2x"
  src="elva-fairy-640w.jpg"
  alt="Elva dressed as a fairy" />
```

Lưu ý rằng mặc dù hình ảnh luôn được hiển thị với cùng kích thước, trên các màn hình độ phân giải cao hơn bạn sẽ thấy nhiều chi tiết hơn.

![Hình ảnh một cô bé ăn mặc như nàng tiên, với hiệu ứng phim ảnh cũ được áp dụng cho hình ảnh](resolution-example.png)

Trong ví dụ này, CSS sau được áp dụng cho hình ảnh để nó có chiều rộng 320 pixel trên màn hình (còn được gọi là CSS pixels):

```css
img {
  width: 320px;
}
```

Trong trường hợp này, `sizes` không cần thiết — trình duyệt xác định độ phân giải của màn hình mà nó đang hiển thị, và phục vụ hình ảnh thích hợp nhất được tham chiếu trong `srcset`. Vì vậy, nếu thiết bị truy cập trang có màn hình độ phân giải chuẩn/thấp, với một {{glossary("device pixel")}} đại diện cho mỗi CSS pixel, hình ảnh `elva-fairy-320w.jpg` sẽ được tải (1x được ngầm hiểu, vì vậy bạn không cần bao gồm nó). Nếu thiết bị có độ phân giải cao là hai device pixel mỗi CSS pixel hoặc hơn, hình ảnh `elva-fairy-640w.jpg` sẽ được tải. Hình ảnh 640px có dung lượng 93KB, trong khi hình ảnh 320px chỉ có 39KB.

### Định hướng nghệ thuật

Để tóm tắt lại, **vấn đề định hướng nghệ thuật** liên quan đến việc muốn thay đổi hình ảnh được hiển thị để phù hợp với các kích thước hiển thị hình ảnh khác nhau. Ví dụ, một trang web bao gồm một ảnh chụp phong cảnh rộng với một người ở giữa khi được xem trên trình duyệt máy tính để bàn. Khi được xem trên trình duyệt di động, hình ảnh tương tự đó bị co lại, khiến người trong ảnh trở nên rất nhỏ và khó nhìn thấy. Có lẽ tốt hơn là hiển thị một hình ảnh dọc nhỏ hơn trên di động, phóng to vào người đó. Phần tử {{htmlelement("picture")}} cho phép chúng ta triển khai chính xác loại giải pháp này.

Quay lại ví dụ [not-responsive.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/not-responsive.html) ban đầu của chúng ta, chúng ta có một hình ảnh rất cần được định hướng nghệ thuật:

```html
<img src="elva-800w.jpg" alt="Chris standing up holding his daughter Elva" />
```

Hãy sửa điều này, với {{htmlelement("picture")}}! Giống như [`<video>` và `<audio>`](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio), phần tử `<picture>` là một wrapper chứa nhiều phần tử {{htmlelement("source")}} cung cấp các nguồn khác nhau để trình duyệt lựa chọn, tiếp theo là phần tử {{htmlelement("img")}} quan trọng nhất. Code trong [responsive.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/responsive.html) trông như thế này:

```html
<picture>
  <source media="(width < 800px)" srcset="elva-480w-close-portrait.jpg" />
  <source media="(width >= 800px)" srcset="elva-800w.jpg" />
  <img src="elva-800w.jpg" alt="Chris standing up holding his daughter Elva" />
</picture>
```

- Các phần tử `<source>` bao gồm thuộc tính `media` chứa một điều kiện media — như với ví dụ `srcset` đầu tiên, những điều kiện này là các bài kiểm tra quyết định hình ảnh nào được hiển thị — hình ảnh đầu tiên trả về đúng sẽ được hiển thị. Trong trường hợp này, nếu chiều rộng viewport nhỏ hơn 800px, hình ảnh của phần tử `<source>` đầu tiên sẽ được hiển thị. Nếu chiều rộng viewport là 800px trở lên, nó sẽ là hình ảnh của phần tử thứ hai.
- Các thuộc tính `srcset` chứa đường dẫn đến hình ảnh cần hiển thị. Giống như chúng ta thấy với `<img>` ở trên, `<source>` có thể lấy thuộc tính `srcset` với nhiều hình ảnh được tham chiếu, cũng như thuộc tính `sizes`. Vì vậy, bạn có thể cung cấp nhiều hình ảnh qua phần tử `<picture>`, nhưng cũng cung cấp nhiều độ phân giải của mỗi hình. Trên thực tế, bạn có thể sẽ không muốn làm loại việc này thường xuyên.
- Trong tất cả các trường hợp, bạn phải cung cấp phần tử `<img>`, với `src` và `alt`, ngay trước `</picture>`, nếu không sẽ không có hình ảnh nào xuất hiện. Điều này cung cấp trường hợp mặc định sẽ áp dụng khi không có điều kiện media nào trả về đúng (bạn thực sự có thể xóa phần tử `<source>` thứ hai trong ví dụ này), và một phương án dự phòng cho các trình duyệt không hỗ trợ phần tử `<picture>`.

Code này cho phép chúng ta hiển thị hình ảnh phù hợp trên cả màn hình rộng và màn hình hẹp, như được hiển thị bên dưới:

![Trang web mẫu của chúng ta khi xem trên màn hình rộng - ở đây hình ảnh đầu tiên hiển thị tốt vì nó đủ lớn để nhìn thấy chi tiết ở giữa.](picture-element-wide.png)![Trang web mẫu của chúng ta khi xem trên màn hình hẹp với phần tử picture được sử dụng để chuyển hình ảnh đầu tiên sang dạng dọc cận cảnh của chi tiết, làm cho nó hữu ích hơn nhiều trên màn hình hẹp](picture-element-narrow.png)

> [!NOTE]
> Bạn chỉ nên sử dụng thuộc tính `media` trong các tình huống định hướng nghệ thuật; khi bạn sử dụng `media`, đừng cũng cung cấp các điều kiện media trong thuộc tính `sizes`.

### Tại sao chúng ta không thể chỉ làm điều này bằng CSS hoặc JavaScript?

Khi trình duyệt bắt đầu tải một trang, nó bắt đầu tải trước (preload) bất kỳ hình ảnh nào trước khi trình phân tích cú pháp chính bắt đầu tải và diễn giải CSS và JavaScript của trang. Cơ chế đó thường hữu ích cho việc giảm thời gian tải trang, nhưng không hữu ích cho hình ảnh responsive — do đó cần phải triển khai các giải pháp như `srcset`. Ví dụ, bạn không thể tải phần tử {{htmlelement("img")}}, sau đó phát hiện chiều rộng viewport bằng JavaScript, và sau đó động thay đổi hình ảnh nguồn thành hình ảnh nhỏ hơn nếu muốn. Lúc đó, hình ảnh gốc đã được tải rồi, và bạn sẽ tải thêm hình ảnh nhỏ, điều này còn tệ hơn theo nghĩa hình ảnh responsive.

## Tự triển khai hình ảnh responsive của bạn

Trong bài tập này, chúng ta mong bạn dũng cảm và tự làm một mình. Chúng ta muốn bạn triển khai art-directed narrow screen/wide screen thích hợp của riêng mình bằng `<picture>`, và một ví dụ chuyển đổi độ phân giải sử dụng `srcset`.

1. Viết một số HTML để chứa code của bạn (sử dụng `not-responsive.html` làm điểm xuất phát, nếu bạn muốn).
2. Tìm một hình ảnh phong cảnh rộng đẹp có chứa một số chi tiết ở đâu đó trong đó. Tạo phiên bản kích thước web của nó bằng trình chỉnh sửa đồ họa, sau đó cắt xén để hiển thị phần nhỏ hơn phóng to vào chi tiết, và tạo hình ảnh thứ hai (khoảng 480px rộng là tốt cho điều này).
3. Sử dụng phần tử `<picture>` để triển khai bộ chuyển đổi hình ảnh art direction!
4. Tạo nhiều file hình ảnh có kích thước khác nhau, mỗi file hiển thị cùng một hình ảnh.
5. Sử dụng `srcset`/`sizes` để tạo ví dụ bộ chuyển đổi độ phân giải, hoặc để phục vụ hình ảnh cùng kích thước ở các độ phân giải khác nhau tùy thuộc vào độ phân giải thiết bị hoặc để phục vụ các kích thước hình ảnh khác nhau tùy thuộc vào chiều rộng viewport.

## Tóm tắt

Đó là tất cả về hình ảnh responsive — chúng ta hy vọng bạn thích thú khi khám phá các kỹ thuật mới này. Tóm tắt lại, có hai vấn đề riêng biệt chúng ta đã thảo luận ở đây:

- **Định hướng nghệ thuật**: Vấn đề trong đó bạn muốn phục vụ các hình ảnh được cắt xén cho các bố cục khác nhau — ví dụ như hình ảnh phong cảnh hiển thị toàn cảnh cho bố cục máy tính để bàn, và hình ảnh dọc hiển thị chủ thể chính được phóng to cho bố cục di động. Bạn có thể giải quyết vấn đề này bằng cách sử dụng phần tử {{htmlelement("picture")}}.
- **Chuyển đổi độ phân giải**: Vấn đề trong đó bạn muốn phục vụ các file hình ảnh nhỏ hơn cho các thiết bị màn hình hẹp, vì chúng không cần hình ảnh lớn như màn hình máy tính để bàn — và để phục vụ các hình ảnh độ phân giải khác nhau cho màn hình mật độ cao/thấp. Bạn có thể giải quyết vấn đề này bằng cách sử dụng [đồ họa vector](/en-US/docs/Learn_web_development/Core/Structuring_content/Including_vector_graphics_in_HTML) (hình ảnh SVG) và các thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) cùng với [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes).

## Xem thêm

- [Tìm hiểu: Thiết kế responsive](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design)
- [Giới thiệu xuất sắc về hình ảnh responsive của Jason Grigsby](https://cloudfour.com/thinks/responsive-images-101-definitions/)
- [Hình ảnh Responsive: Nếu bạn chỉ thay đổi độ phân giải, hãy sử dụng srcset](https://css-tricks.com/responsive-images-youre-just-changing-resolutions-use-srcset/) — bao gồm thêm giải thích về cách trình duyệt xác định hình ảnh nào cần sử dụng
- {{htmlelement("img")}}
- {{htmlelement("picture")}}
- {{htmlelement("source")}}
