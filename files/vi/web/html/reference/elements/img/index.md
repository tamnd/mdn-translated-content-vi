---
title: "<img>: Phần tử Nhúng Hình ảnh"
slug: Web/HTML/Reference/Elements/img
page-type: html-element
browser-compat: html.elements.img
sidebar: htmlsidebar
---

Phần tử **`<img>`** [HTML](/en-US/docs/Web/HTML) nhúng một hình ảnh vào tài liệu.

{{InteractiveExample("HTML Demo: &lt;img&gt;", "tabbed-standard")}}

```html interactive-example
<img
  class="fit-picture"
  src="/shared-assets/images/examples/grapefruit-slice.jpg"
  alt="Grapefruit slice atop a pile of other slices" />
```

```css interactive-example
.fit-picture {
  width: 250px;
}
```

Ví dụ trên cho thấy cách sử dụng phần tử `<img>`:

- Thuộc tính `src` chứa đường dẫn đến hình ảnh bạn muốn nhúng. Nó không bắt buộc nếu thuộc tính [srcset](/en-US/docs/Web/API/HTMLImageElement/srcset) có sẵn. Tuy nhiên, ít nhất một trong hai thuộc tính `src` hoặc `srcset` phải được cung cấp.
- Thuộc tính `alt` chứa văn bản thay thế cho hình ảnh, đây là thuộc tính bắt buộc và **cực kỳ hữu ích** cho khả năng tiếp cận — trình đọc màn hình đọc giá trị thuộc tính ra cho người dùng để họ biết hình ảnh có ý nghĩa gì. Văn bản thay thế cũng được hiển thị trên trang nếu hình ảnh không thể tải vì lý do nào đó: ví dụ, lỗi mạng, chặn nội dung, hoặc đường dẫn bị hỏng.

Có nhiều thuộc tính khác để đạt được các mục đích khác nhau:

- Kiểm soát [Referrer](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy)/{{glossary("CORS")}} để bảo mật và quyền riêng tư: xem [`crossorigin`](#crossorigin) và [`referrerpolicy`](#referrerpolicy).
- Dùng cả [`width`](#width) và [`height`](#height) để đặt kích thước nội tại của hình ảnh, cho phép nó chiếm không gian trước khi tải, nhằm giảm thiểu thay đổi bố cục nội dung.
- Gợi ý hình ảnh đáp ứng với [`sizes`](#sizes) và [`srcset`](#srcset) (xem thêm phần tử {{htmlelement("picture")}} và hướng dẫn [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images) của chúng tôi).

## Các định dạng hình ảnh được hỗ trợ

Tiêu chuẩn HTML không liệt kê các định dạng hình ảnh cần hỗ trợ, vì vậy {{glossary("user agent","các tác nhân người dùng")}} có thể hỗ trợ các định dạng khác nhau.

> [!NOTE]
> [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types) cung cấp thông tin toàn diện về các định dạng hình ảnh và hỗ trợ trình duyệt web của chúng.
> Phần này chỉ là tóm tắt!

Các định dạng tệp hình ảnh được sử dụng phổ biến nhất trên web là:

- [APNG (Animated Portable Network Graphics)](/en-US/docs/Web/Media/Guides/Formats/Image_types#apng_animated_portable_network_graphics) — Lựa chọn tốt cho chuỗi hoạt ảnh không mất dữ liệu (GIF kém hiệu năng hơn)
- [AVIF (AV1 Image File Format)](/en-US/docs/Web/Media/Guides/Formats/Image_types#avif_image) — Lựa chọn tốt cho cả hình ảnh tĩnh và động nhờ hiệu năng cao.
- [GIF (Graphics Interchange Format)](/en-US/docs/Web/Media/Guides/Formats/Image_types#gif_graphics_interchange_format) — Lựa chọn tốt cho hình ảnh và hoạt ảnh _đơn giản_.
- [JPEG (Joint Photographic Expert Group image)](/en-US/docs/Web/Media/Guides/Formats/Image_types#jpeg_joint_photographic_experts_group_image) — Lựa chọn tốt cho nén mất dữ liệu của hình ảnh tĩnh (hiện tại phổ biến nhất).
- [PNG (Portable Network Graphics)](/en-US/docs/Web/Media/Guides/Formats/Image_types#png_portable_network_graphics) — Lựa chọn tốt cho nén không mất dữ liệu của hình ảnh tĩnh (chất lượng tốt hơn JPEG một chút).
- [SVG (Scalable Vector Graphics)](/en-US/docs/Web/Media/Guides/Formats/Image_types#svg_scalable_vector_graphics) — Định dạng hình ảnh vector. Dùng cho các hình ảnh cần được vẽ chính xác ở các kích thước khác nhau.
- [WebP (Web Picture format)](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image) — Lựa chọn xuất sắc cho cả hình ảnh tĩnh và động

Các định dạng như [WebP](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image) và [AVIF](/en-US/docs/Web/Media/Guides/Formats/Image_types#avif_image) được khuyến nghị vì chúng hoạt động tốt hơn nhiều so với PNG, JPEG, GIF cho cả hình ảnh tĩnh và động.

SVG vẫn là định dạng được khuyến nghị cho các hình ảnh cần được vẽ chính xác ở các kích thước khác nhau.

## Lỗi tải hình ảnh

Nếu có lỗi xảy ra khi tải hoặc hiển thị hình ảnh, và bộ xử lý sự kiện `onerror` đã được đặt cho sự kiện {{domxref("HTMLElement/error_event", "error")}}, bộ xử lý sự kiện đó sẽ được gọi. Điều này có thể xảy ra trong một số tình huống, bao gồm:

- Thuộc tính `src` hoặc `srcset` rỗng (`""`) hoặc `null`.
- {{glossary("URL")}} của `src` giống với URL của trang người dùng đang xem.
- Hình ảnh bị hỏng theo một cách nào đó ngăn nó được tải.
- Siêu dữ liệu của hình ảnh bị hỏng theo cách không thể truy xuất kích thước của nó, và không có kích thước nào được chỉ định trong các thuộc tính của phần tử `<img>`.
- Hình ảnh ở định dạng không được {{Glossary("user agent")}} hỗ trợ.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `alt`
  - : Định nghĩa văn bản có thể thay thế hình ảnh trên trang.

    > [!NOTE]
    > Trình duyệt không phải lúc nào cũng hiển thị hình ảnh. Có một số tình huống mà trình duyệt có thể không hiển thị hình ảnh, chẳng hạn:
    >
    > - Trình duyệt không trực quan (như những trình duyệt được dùng bởi người khiếm thị)
    > - Người dùng chọn không hiển thị hình ảnh (tiết kiệm băng thông, lý do riêng tư)
    > - Hình ảnh không hợp lệ hoặc là [loại không được hỗ trợ](#supported_image_formats)
    >
    > Trong những trường hợp này, trình duyệt có thể thay thế hình ảnh bằng văn bản trong thuộc tính `alt` của phần tử. Vì những lý do này và những lý do khác, hãy cung cấp giá trị hữu ích cho `alt` bất cứ khi nào có thể.

    Đặt thuộc tính này thành chuỗi rỗng (`alt=""`) cho biết hình ảnh này _không_ phải là phần quan trọng của nội dung (đây là trang trí hoặc điểm theo dõi), và các trình duyệt không trực quan có thể bỏ qua nó khi {{glossary("Engine/Rendering", "hiển thị")}}. Các trình duyệt trực quan cũng sẽ ẩn biểu tượng hình ảnh bị hỏng nếu thuộc tính `alt` rỗng và hình ảnh không hiển thị được.

    Thuộc tính này cũng được dùng khi sao chép và dán hình ảnh sang văn bản, hoặc khi lưu hình ảnh được liên kết vào dấu trang.

- `attributionsrc` {{deprecated_inline}}
  - : Chỉ định rằng bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu hình ảnh.

    Ở phía máy chủ, điều này được dùng để kích hoạt việc gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi, để đăng ký [nguồn phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#html-based_event_sources) hoặc [điểm kích hoạt phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#html-based_attribution_triggers) dựa trên hình ảnh. Tiêu đề phản hồi nào cần gửi lại phụ thuộc vào giá trị của tiêu đề `Attribution-Reporting-Eligible` đã kích hoạt đăng ký.

    Sự kiện nguồn hoặc điểm kích hoạt tương ứng được kích hoạt sau khi trình duyệt nhận phản hồi chứa tệp hình ảnh.

    > [!NOTE]
    > Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

    Có hai phiên bản của thuộc tính này mà bạn có thể đặt:
    - Boolean, tức là chỉ tên `attributionsrc`. Điều này chỉ định rằng bạn muốn tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} được gửi đến cùng máy chủ mà thuộc tính `src` trỏ đến. Điều này ổn khi bạn xử lý đăng ký nguồn phân bổ hoặc điểm kích hoạt trên cùng một máy chủ. Khi đăng ký điểm kích hoạt phân bổ, thuộc tính này là tùy chọn và giá trị boolean sẽ được sử dụng nếu bỏ qua.
    - Giá trị chứa một hoặc nhiều URL, ví dụ:

    ```html
    <img
      src="image-file.png"
      alt="My image file description"
      attributionsrc="https://a.example/register-source
                         https://b.example/register-source" />
    ```

    Điều này hữu ích trong các trường hợp tài nguyên được yêu cầu không nằm trên máy chủ bạn kiểm soát, hoặc bạn chỉ muốn xử lý đăng ký nguồn phân bổ trên một máy chủ khác. Trong trường hợp này, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionsrc`. Khi yêu cầu tài nguyên xảy ra, tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi đến (các) URL được chỉ định trong `attributionSrc` ngoài nguồn gốc tài nguyên. Các URL này sau đó có thể phản hồi với tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} phù hợp để hoàn tất đăng ký.

    > [!NOTE]
    > Chỉ định nhiều URL có nghĩa là có thể đăng ký nhiều nguồn phân bổ trên cùng một tính năng. Ví dụ, bạn có thể có các chiến dịch khác nhau mà bạn đang cố đo lường hiệu quả, liên quan đến việc tạo các báo cáo khác nhau về dữ liệu khác nhau.

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
  - : Chỉ định liệu việc tải hình ảnh có phải được thực hiện bằng yêu cầu {{glossary("CORS")}} hay không. Dữ liệu hình ảnh từ [hình ảnh hỗ trợ CORS](/en-US/docs/Web/HTML/How_to/CORS_enabled_image) được trả về từ yêu cầu CORS có thể được tái sử dụng trong phần tử {{HTMLElement("canvas")}} mà không bị đánh dấu là "[bị nhiễm](/en-US/docs/Web/HTML/How_to/CORS_enabled_image#security_and_tainted_canvases)".

    Nếu thuộc tính `crossorigin` _không_ được chỉ định, thì một yêu cầu không phải CORS được gửi (không có tiêu đề yêu cầu {{httpheader("Origin")}}), và trình duyệt đánh dấu hình ảnh là bị nhiễm và hạn chế quyền truy cập vào dữ liệu hình ảnh của nó, ngăn việc sử dụng trong các phần tử {{HTMLElement("canvas")}}.

    Nếu thuộc tính `crossorigin` _được_ chỉ định, thì một yêu cầu CORS được gửi (với tiêu đề yêu cầu {{httpheader("Origin")}}); nhưng nếu máy chủ không cho phép truy cập nguồn gốc chéo vào dữ liệu hình ảnh bởi trang web nguồn gốc (bằng cách không gửi bất kỳ tiêu đề phản hồi {{httpheader("Access-Control-Allow-Origin")}} nào, hoặc bằng cách không bao gồm nguồn gốc của trang web trong bất kỳ tiêu đề phản hồi {{httpheader("Access-Control-Allow-Origin")}} nào mà nó gửi), thì trình duyệt chặn việc tải hình ảnh và ghi lại lỗi CORS vào bảng điều khiển devtools.

    Các giá trị được phép:
    - `anonymous`
      - : Yêu cầu CORS được gửi mà không có thông tin xác thực (nghĩa là không có {{glossary("cookie", "cookies")}}, [chứng chỉ X.509](https://datatracker.ietf.org/doc/html/rfc5280), hay tiêu đề yêu cầu {{httpheader("Authorization")}}).
    - `use-credentials`
      - : Yêu cầu CORS được gửi với bất kỳ thông tin xác thực nào bao gồm (nghĩa là cookies, chứng chỉ X.509, và tiêu đề yêu cầu `Authorization`). Nếu máy chủ không chọn chia sẻ thông tin xác thực với trang web nguồn gốc (bằng cách gửi lại tiêu đề phản hồi `Access-Control-Allow-Credentials: true`), thì trình duyệt đánh dấu hình ảnh là bị nhiễm và hạn chế quyền truy cập vào dữ liệu hình ảnh của nó.

    Nếu thuộc tính có giá trị không hợp lệ, trình duyệt xử lý nó như thể giá trị `anonymous` được sử dụng. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm thông tin.

- `decoding`
  - : Thuộc tính này cung cấp gợi ý cho trình duyệt về việc nó có nên thực hiện giải mã hình ảnh cùng với việc hiển thị nội dung DOM khác trong một bước trình bày duy nhất trông "đúng hơn" (`sync`), hay hiển thị và trình bày nội dung DOM khác trước rồi giải mã và trình bày hình ảnh sau (`async`). Trong thực tế, `async` có nghĩa là lần vẽ tiếp theo không cần đợi hình ảnh giải mã.

    Thường khó nhận thấy bất kỳ hiệu ứng đáng chú ý nào khi sử dụng `decoding` trên các phần tử `<img>` tĩnh. Chúng có thể ban đầu được hiển thị dưới dạng hình ảnh rỗng trong khi các tệp hình ảnh được tải (từ mạng hoặc từ bộ đệm) và sau đó được xử lý độc lập, vì vậy "đồng bộ hóa" cập nhật nội dung ít rõ ràng hơn. Tuy nhiên, việc chặn hiển thị trong khi giải mã xảy ra, mặc dù thường rất nhỏ, _có thể_ được đo lường — ngay cả khi khó quan sát bằng mắt thường. Xem [What does the image decoding attribute actually do?](https://www.tunetheweb.com/blog/what-does-the-image-decoding-attribute-actually-do/) để phân tích chi tiết hơn (tunetheweb.com, 2023).

    Sử dụng các loại `decoding` khác nhau có thể dẫn đến sự khác biệt đáng chú ý hơn khi chèn động các phần tử `<img>` vào DOM qua JavaScript — xem {{domxref("HTMLImageElement.decoding")}} để biết thêm chi tiết.

    Các giá trị được phép:
    - `sync`
      - : Giải mã hình ảnh đồng bộ cùng với hiển thị nội dung DOM khác, và trình bày tất cả cùng nhau.
    - `async`
      - : Giải mã hình ảnh không đồng bộ, sau khi hiển thị và trình bày nội dung DOM khác.
    - `auto`
      - : Không có ưu tiên cho chế độ giải mã; trình duyệt quyết định điều gì là tốt nhất cho người dùng. Đây là giá trị mặc định.

- [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming)
  - : Đánh dấu hình ảnh để quan sát bởi API {{domxref("PerformanceElementTiming")}}. Giá trị được đưa ra trở thành mã định danh cho phần tử hình ảnh được quan sát. Xem thêm trang thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming).

- [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority)
  - : Cung cấp gợi ý về mức ưu tiên tương đối khi tải hình ảnh. Các giá trị được phép:
    - `high`
      - : Tải hình ảnh với mức ưu tiên cao so với các hình ảnh khác.
    - `low`
      - : Tải hình ảnh với mức ưu tiên thấp so với các hình ảnh khác.
    - `auto`
      - : Không đặt ưu tiên cho việc tải.
        Đây là giá trị mặc định.
        Được sử dụng nếu không có giá trị hoặc giá trị không hợp lệ được đặt.
- `height`
  - : Chiều cao nội tại của hình ảnh, tính bằng pixel. Phải là số nguyên không có đơn vị.

    > [!NOTE]
    > Bao gồm `height` và [`width`](#width) cho phép trình duyệt tính toán {{glossary("aspect ratio")}} của hình ảnh trước khi hình ảnh được tải. Tỷ lệ khung hình này được dùng để dự trữ không gian cần thiết để hiển thị hình ảnh, giảm hoặc thậm chí ngăn chặn thay đổi bố cục khi hình ảnh được tải và vẽ lên màn hình. Giảm thiểu thay đổi bố cục là một thành phần quan trọng của trải nghiệm người dùng tốt và hiệu năng web.

- `ismap`
  - : Thuộc tính Boolean này cho biết hình ảnh là một phần của [bản đồ phía máy chủ](https://en.wikipedia.org/wiki/Image_map#Server-side). Nếu vậy, các tọa độ nơi người dùng nhấp vào hình ảnh sẽ được gửi đến máy chủ.

    > [!NOTE]
    > Thuộc tính này chỉ được phép nếu phần tử `<img>` là con của phần tử {{htmlelement("a")}} với thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) hợp lệ. Điều này cung cấp cho người dùng không có thiết bị trỏ một đích đến dự phòng.

- `loading`
  - : Chỉ định cách trình duyệt nên tải hình ảnh:
    - `eager`
      - : Tải hình ảnh ngay lập tức, bất kể hình ảnh hiện có trong vùng hiển thị hay không (đây là giá trị mặc định).
    - `lazy`
      - : Trì hoãn tải hình ảnh cho đến khi nó đạt đến một khoảng cách tính toán từ vùng hiển thị, như được xác định bởi trình duyệt.

        Tải chậm tránh được băng thông mạng và lưu trữ cần thiết để xử lý hình ảnh cho đến khi chắc chắn hợp lý rằng nó sẽ cần thiết. Điều này cải thiện hiệu năng trong hầu hết các trường hợp sử dụng thông thường.

    Trong khi các thuộc tính [`width`](#width) và [`height`](#height) rõ ràng được khuyến nghị cho tất cả hình ảnh để tránh thay đổi bố cục, chúng đặc biệt quan trọng cho các hình ảnh tải chậm. Hình ảnh tải chậm sẽ không bao giờ được tải nếu chúng không giao với phần hiển thị của phần tử, ngay cả khi tải chúng sẽ thay đổi điều đó, vì các hình ảnh chưa tải có `width` và `height` bằng `0`. Nó tạo ra trải nghiệm người dùng thậm chí gây rối hơn khi nội dung hiển thị trong vùng hiển thị bị sắp xếp lại ở giữa lúc đọc.

    Hình ảnh tải chậm nằm trong vùng hiển thị trực quan có thể chưa hiển thị khi sự kiện {{domxref("Window.load_event", "load")}} của Window được kích hoạt. Điều này là vì sự kiện được kích hoạt dựa trên hình ảnh tải liền — hình ảnh tải chậm không được tính đến ngay cả khi chúng nằm trong vùng hiển thị trực quan khi trang được tải lần đầu.

    Tải chỉ bị trì hoãn khi JavaScript được bật. Đây là biện pháp chống theo dõi, vì nếu tác nhân người dùng hỗ trợ tải chậm khi script bị vô hiệu hóa, vẫn có thể cho một trang web theo dõi vị trí cuộn xấp xỉ của người dùng trong suốt một phiên, bằng cách đặt chiến lược các hình ảnh trong đánh dấu trang sao cho máy chủ có thể theo dõi có bao nhiêu hình ảnh được yêu cầu và khi nào.

- `referrerpolicy`
  - : Một chuỗi cho biết referrer nào cần sử dụng khi tải tài nguyên:
    - `no-referrer`: Tiêu đề {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade`: Tiêu đề {{HTTPHeader("Referer")}} sẽ không được gửi đến {{Glossary("origin")}} không có {{Glossary("TLS")}} ({{Glossary("HTTPS")}}).
    - `origin`: Referrer được gửi sẽ bị giới hạn ở nguồn gốc của trang giới thiệu: [scheme](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), {{Glossary("host")}}, và {{Glossary("port")}}.
    - `origin-when-cross-origin`: Referrer được gửi đến các nguồn gốc khác sẽ bị giới hạn ở scheme, host, và port. Điều hướng trên cùng nguồn gốc vẫn sẽ bao gồm đường dẫn.
    - `same-origin`: Referrer sẽ được gửi cho {{Glossary("Same-origin policy", "cùng nguồn gốc")}}, nhưng các yêu cầu nguồn gốc chéo sẽ không chứa thông tin referrer.
    - `strict-origin`: Chỉ gửi nguồn gốc của tài liệu làm referrer khi mức độ bảo mật giao thức vẫn giữ nguyên (HTTPS→HTTPS), nhưng không gửi đến đích kém an toàn hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` (mặc định): Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), và không gửi tiêu đề đến đích kém an toàn hơn (HTTPS→HTTP).
    - `unsafe-url`: Referrer sẽ bao gồm nguồn gốc _và_ đường dẫn (nhưng không phải [fragment](/en-US/docs/Web/API/HTMLAnchorElement/hash), [password](/en-US/docs/Web/API/HTMLAnchorElement/password), hay [username](/en-US/docs/Web/API/HTMLAnchorElement/username)). **Giá trị này không an toàn**, vì nó rò rỉ nguồn gốc và đường dẫn từ các tài nguyên được bảo vệ TLS đến các nguồn gốc không an toàn.

- `sizes`
  - : Một hoặc nhiều giá trị được phân tách bằng dấu phẩy, có thể là kích thước nguồn hoặc từ khóa `auto`. Thông số kỹ thuật yêu cầu thuộc tính `sizes` chỉ có mặt khi `srcset` sử dụng mô tả độ rộng.

    **Kích thước nguồn** bao gồm:
    1. Một [điều kiện media](/en-US/docs/Web/CSS/Guides/Media_queries/Using#syntax), bỏ qua cho mục cuối cùng trong danh sách.
    2. Một giá trị kích thước nguồn.

    Điều kiện media mô tả các thuộc tính của _vùng hiển thị_, không phải _hình ảnh_. Ví dụ, `(height <= 500px) 1000px` đề xuất sử dụng nguồn hình ảnh rộng 1000px nếu _vùng hiển thị_ cao 500px hoặc ít hơn. Vì mô tả kích thước nguồn chỉ định chiều rộng cần sử dụng cho hình ảnh trong bố cục, điều kiện media thường (nhưng không nhất thiết) dựa trên {{cssxref("@media/width")}}.

    Giá trị kích thước nguồn chỉ định kích thước hiển thị dự định của hình ảnh. {{glossary("User agent", "Tác nhân người dùng")}} sử dụng kích thước nguồn hiện tại để chọn một trong các nguồn được cung cấp bởi thuộc tính `srcset`, khi các nguồn đó được mô tả bằng mô tả độ rộng (`w`). Kích thước nguồn được chọn ảnh hưởng đến {{glossary("intrinsic size")}} của hình ảnh (kích thước hiển thị của hình ảnh nếu không có kiểu dáng {{glossary("CSS")}} nào được áp dụng).

    Giá trị kích thước nguồn có thể là bất kỳ [chiều dài](/en-US/docs/Web/CSS/Reference/Values/length) không âm nào. Nó không được sử dụng các hàm CSS khác ngoài [hàm toán học](/en-US/docs/Web/CSS/Reference/Values/Functions#math_functions). Các đơn vị được diễn giải theo cách tương tự như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries), nghĩa là tất cả các đơn vị chiều dài tương đối đều tương đối với gốc tài liệu chứ không phải phần tử `<img>`. Ví dụ, giá trị `em` tương đối với cỡ chữ gốc, không phải cỡ chữ của hình ảnh. Giá trị [phần trăm](/en-US/docs/Web/CSS/Reference/Values/percentage) không được phép. Nếu thuộc tính `sizes` không được cung cấp, giá trị mặc định là `100vw` (chiều rộng vùng hiển thị).

    Từ khóa `auto` có thể thay thế toàn bộ danh sách kích thước hoặc mục đầu tiên trong danh sách. Nó chỉ hợp lệ khi kết hợp với `loading="lazy"`, và phân giải thành [kích thước cụ thể](/en-US/docs/Web/CSS/Reference/Values/image) của hình ảnh. Vì kích thước nội tại của hình ảnh chưa được biết, thuộc tính `width` và `height` (hoặc các tương đương CSS) cũng nên được chỉ định để ngăn trình duyệt giả định chiều rộng hình ảnh mặc định là 300px.
    Để tương thích ngược tốt hơn với các trình duyệt không hỗ trợ `auto`, bạn có thể bao gồm kích thước dự phòng sau `auto` trong thuộc tính `sizes`:

    ```html
    <img
      loading="lazy"
      width="200"
      height="200"
      sizes="auto, (max-width: 30em) 100vw, (max-width: 50em) 50vw, calc(33vw - 100px)"
      srcset="
        swing-200.jpg   200w,
        swing-400.jpg   400w,
        swing-800.jpg   800w,
        swing-1600.jpg 1600w
      "
      src="swing-400.jpg"
      alt="Kettlebell Swing" />
    ```

- `src`
  - : {{glossary("URL")}} của hình ảnh. Ít nhất một trong `src` và [`srcset`](#srcset) là bắt buộc cho phần tử `<img>`. Nếu [`srcset`](#srcset) được chỉ định, `src` được sử dụng theo một trong hai cách:
    - như là dự phòng cho các trình duyệt không hỗ trợ `srcset`.
    - nếu `srcset` sử dụng mô tả "x", thì `src` tương đương với một nguồn có mô tả mật độ `1x`; nghĩa là hình ảnh được chỉ định bởi `src` được sử dụng trên màn hình mật độ thấp (như màn hình 72 DPI hoặc 96 DPI thông thường).

- `srcset`
  - : Một hoặc nhiều chuỗi được phân tách bằng dấu phẩy, cho biết các nguồn hình ảnh có thể để {{glossary("user agent")}} sử dụng.

    Mỗi chuỗi bao gồm:
    1. Một {{glossary("URL")}} đến hình ảnh
    2. Tùy chọn, khoảng trắng theo sau bởi một trong:
       - Mô tả độ rộng (một số nguyên dương theo sau trực tiếp bởi `w`). Nó _phải_ khớp với chiều rộng nội tại của hình ảnh được tham chiếu. Mô tả độ rộng được chia cho kích thước nguồn được đưa ra trong thuộc tính `sizes` để tính toán mật độ pixel hiệu quả. Ví dụ, để cung cấp tài nguyên hình ảnh được sử dụng khi trình hiển thị cần hình ảnh rộng 450 pixel, sử dụng mô tả độ rộng `450w`. Khi `srcset` chứa mô tả "w", trình duyệt sử dụng các mô tả đó cùng với thuộc tính `sizes` để chọn tài nguyên.
       - Mô tả mật độ pixel (một số thực dương theo sau trực tiếp bởi `x`). Nó chỉ định điều kiện mà tài nguyên hình ảnh tương ứng nên được sử dụng làm mật độ pixel của màn hình. Ví dụ, để cung cấp tài nguyên hình ảnh được sử dụng khi mật độ pixel gấp đôi mật độ tiêu chuẩn, sử dụng mô tả mật độ pixel `2x` hoặc `2.0x`.

    Nếu không có mô tả nào được chỉ định, nguồn được gán mô tả mặc định là `1x`. Không đúng khi trộn mô tả độ rộng và mô tả mật độ pixel trong cùng một thuộc tính `srcset`. Mô tả trùng lặp (ví dụ, hai nguồn trong cùng `srcset` đều được mô tả bằng `2x`) cũng không hợp lệ.

    Ký tự khoảng trắng, ngoài khoảng trắng phân tách URL và mô tả điều kiện tương ứng, bị bỏ qua; điều này bao gồm cả khoảng trắng dẫn và khoảng trắng cuối, cũng như khoảng trắng trước hoặc sau mỗi dấu phẩy. Tuy nhiên, nếu chuỗi ứng viên hình ảnh không chứa mô tả và không có khoảng trắng sau URL, chuỗi ứng viên hình ảnh tiếp theo, nếu có, phải bắt đầu bằng một hoặc nhiều khoảng trắng, nếu không dấu phẩy sẽ được coi là một phần của URL.

    Khi thuộc tính `srcset` của phần tử `<img>` sử dụng mô tả `x`, trình duyệt cũng coi URL trong thuộc tính `src` (nếu có) là ứng viên, và gán cho nó mô tả mặc định là `1x`. Mặt khác, nếu thuộc tính `srcset` sử dụng mô tả độ rộng, `src` không được xem xét, và thuộc tính `sizes` được sử dụng thay thế.

    Tác nhân người dùng chọn bất kỳ nguồn nào có sẵn theo quyết định của họ. Điều này cung cấp cho họ sự linh hoạt đáng kể để điều chỉnh lựa chọn của mình dựa trên các yếu tố như sở thích người dùng hoặc điều kiện {{glossary("bandwidth")}}. Xem hướng dẫn [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images) của chúng tôi để biết ví dụ.

- `width`
  - : Chiều rộng nội tại của hình ảnh tính bằng pixel. Phải là số nguyên không có đơn vị.
- `usemap`
  - : {{glossary("URL")}} một phần (bắt đầu bằng `#`) của [bản đồ hình ảnh](/en-US/docs/Web/HTML/Reference/Elements/map) liên kết với phần tử.

    > [!NOTE]
    > Bạn không thể sử dụng thuộc tính này nếu phần tử `<img>` nằm trong phần tử {{htmlelement("a")}} hoặc {{HTMLElement("button")}}.

### Các thuộc tính đã lỗi thời

- `align` {{deprecated_inline}}
  - : Căn chỉnh hình ảnh với ngữ cảnh xung quanh. Sử dụng các thuộc tính CSS {{cssxref('float')}} và/hoặc {{cssxref('vertical-align')}} thay thế. Các giá trị được phép:
    - `top`
      - : Tương đương với `vertical-align: top` hoặc `vertical-align: text-top`
    - `middle`
      - : Tương đương với `vertical-align: -moz-middle-with-baseline`
    - `bottom`
      - : Mặc định, tương đương với `vertical-align: unset` hoặc `vertical-align: initial`
    - `left`
      - : Tương đương với `float: left`
    - `right`
      - : Tương đương với `float: right`

- `border` {{deprecated_inline}}
  - : Chiều rộng của viền xung quanh hình ảnh. Sử dụng thuộc tính CSS {{cssxref('border')}} thay thế.
- `hspace` {{deprecated_inline}}
  - : Số pixel khoảng trắng bên trái và phải của hình ảnh. Sử dụng thuộc tính CSS {{cssxref('margin')}} thay thế.
- `longdesc` {{deprecated_inline}}
  - : Liên kết đến mô tả chi tiết hơn về hình ảnh. Các giá trị có thể là {{glossary("URL")}} hoặc [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử.

    > [!NOTE]
    > Thuộc tính này được coi là lỗi thời trong [HTML spec](https://html.spec.whatwg.org/multipage/obsolete.html#element-attrdef-img-longdesc). Nó có tương lai không chắc chắn; các tác giả nên sử dụng thay thế {{glossary("WAI")}}-{{glossary("ARIA")}} như [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) hoặc [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details).

- `name` {{deprecated_inline}}
  - : Tên cho phần tử. Sử dụng thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) thay thế.
- `vspace` {{deprecated_inline}}
  - : Số pixel khoảng trắng phía trên và dưới hình ảnh. Sử dụng thuộc tính CSS {{cssxref('margin')}} thay thế.

## Tạo kiểu với CSS

`<img>` là một {{ glossary("replaced elements", "phần tử thay thế")}}; nó có giá trị {{cssxref("display")}} mặc định là `inline`, nhưng kích thước mặc định của nó được xác định bởi các giá trị nội tại của hình ảnh được nhúng, giống như `inline-block`. Bạn có thể đặt các thuộc tính như {{cssxref("border")}}/{{cssxref("border-radius")}}, {{cssxref("padding")}}/{{cssxref("margin")}}, {{cssxref("width")}}, {{cssxref("height")}}, v.v. trên hình ảnh.

`<img>` không có đường cơ sở, vì vậy khi hình ảnh được sử dụng trong ngữ cảnh định dạng nội tuyến với {{cssxref("vertical-align", "vertical-align: baseline")}}, phần dưới của hình ảnh sẽ được đặt trên đường cơ sở văn bản.

Bạn có thể sử dụng thuộc tính {{cssxref("object-position")}} để định vị hình ảnh trong hộp của phần tử, và thuộc tính {{cssxref("object-fit")}} để điều chỉnh kích thước của hình ảnh trong hộp (ví dụ, liệu hình ảnh có vừa với hộp hay lấp đầy nó ngay cả khi cần cắt xén).

Tùy thuộc vào loại của nó, hình ảnh có thể có chiều rộng và chiều cao nội tại. Tuy nhiên, đối với một số loại hình ảnh, kích thước nội tại là không cần thiết. Ví dụ, hình ảnh {{glossary("SVG")}} không có kích thước nội tại nếu phần tử {{SVGElement("svg")}} gốc của chúng không có `width` hoặc `height` được đặt trên nó.

## Khả năng tiếp cận

### Tạo mô tả thay thế có ý nghĩa

Giá trị của thuộc tính `alt` cần cung cấp văn bản thay thế rõ ràng và ngắn gọn cho nội dung hình ảnh. Nó không nên mô tả sự hiện diện của chính hình ảnh hay tên tệp của hình ảnh. Nếu thuộc tính `alt` được cố ý bỏ qua vì hình ảnh không có tương đương văn bản, hãy cân nhắc các phương pháp thay thế để trình bày nội dung mà hình ảnh đang cố gắng truyền đạt.

#### Không nên

```html example-bad
<img alt="image" src="penguin.jpg" />
```

#### Nên

```html example-good
<img alt="A Penguin on a beach." src="penguin.jpg" />
```

Một bài kiểm tra khả năng tiếp cận quan trọng là đọc nội dung thuộc tính `alt` cùng với nội dung văn bản đứng trước để xem liệu nó có truyền đạt cùng ý nghĩa với hình ảnh hay không. Ví dụ, nếu hình ảnh được đứng trước câu "Trong chuyến du lịch của tôi, tôi thấy một con vật nhỏ dễ thương:", ví dụ _Không nên_ có thể được trình đọc màn hình đọc là "Trong chuyến du lịch của tôi, tôi thấy một con vật nhỏ dễ thương: hình ảnh", điều này không có nghĩa. Ví dụ _Nên_ có thể được trình đọc màn hình đọc là "Trong chuyến du lịch của tôi, tôi thấy một con vật nhỏ dễ thương: Một chú chim cánh cụt trên bãi biển.", điều này có nghĩa.

Đối với hình ảnh được sử dụng để kích hoạt một hành động, ví dụ hình ảnh lồng trong phần tử {{htmlelement("a")}} hoặc {{htmlelement("button")}}, hãy cân nhắc mô tả hành động được kích hoạt trong giá trị thuộc tính `alt`. Ví dụ, bạn có thể viết `alt="trang tiếp theo"` thay vì `alt="mũi tên phải"`. Bạn cũng có thể cân nhắc thêm mô tả bổ sung tùy chọn trong thuộc tính `title`; điều này có thể được trình đọc màn hình đọc nếu người dùng yêu cầu.

Khi thuộc tính `alt` không có trên hình ảnh, một số trình đọc màn hình có thể thông báo tên tệp của hình ảnh thay thế. Điều này có thể là trải nghiệm gây nhầm lẫn nếu tên tệp không đại diện cho nội dung hình ảnh.

- [An alt Decision Tree • Images • WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/images/decision-tree/)
- [Alt-texts: The Ultimate Guide — Axess Lab](https://axesslab.com/alt-texts/)
- [How to Design Great Alt Text: An Introduction | Deque](https://www.deque.com/blog/great-alt-text-introduction/)
- [MDN Understanding WCAG, Guideline 1.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

### Nhận dạng SVG là hình ảnh

Do [lỗi VoiceOver](https://webkit.org/b/216364), VoiceOver không thông báo chính xác hình ảnh SVG là hình ảnh. Bao gồm [`role="img"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role) vào tất cả các phần tử `<img>` có tệp nguồn SVG để đảm bảo các công nghệ hỗ trợ thông báo chính xác SVG là nội dung hình ảnh.

```html
<img src="mdn.svg" alt="MDN" role="img" />
```

### Thuộc tính title

Thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) không phải là sự thay thế chấp nhận được cho thuộc tính `alt`. Ngoài ra, tránh trùng lặp giá trị thuộc tính `alt` trong thuộc tính `title` được khai báo trên cùng một hình ảnh. Làm như vậy có thể khiến một số trình đọc màn hình thông báo cùng một văn bản hai lần, tạo ra trải nghiệm gây nhầm lẫn.

Thuộc tính `title` cũng không nên được sử dụng như thông tin chú thích bổ sung để đi kèm với mô tả `alt` của hình ảnh. Nếu hình ảnh cần chú thích, sử dụng các phần tử [`figure`](/en-US/docs/Web/HTML/Reference/Elements/figure) và [`figcaption`](/en-US/docs/Web/HTML/Reference/Elements/figcaption).

Giá trị của thuộc tính `title` thường được trình bày cho người dùng dưới dạng chú thích công cụ, xuất hiện ngay sau khi con trỏ ngừng di chuyển qua hình ảnh. Trong khi điều này _có thể_ cung cấp thêm thông tin cho người dùng, bạn không nên giả định rằng người dùng sẽ bao giờ thấy nó: người dùng có thể chỉ có bàn phím hoặc màn hình cảm ứng. Nếu bạn có thông tin đặc biệt quan trọng hoặc có giá trị cho người dùng, hãy trình bày nội tuyến bằng cách sử dụng một trong các phương pháp được đề cập ở trên thay vì sử dụng `title`.

- [Using the HTML title attribute – updated | Vispero](https://vispero.com/resources/using-the-html-title-attribute-updated/)

## Ví dụ

### Văn bản thay thế

Ví dụ sau đây nhúng một hình ảnh vào trang và bao gồm văn bản thay thế để đảm bảo khả năng tiếp cận.

```html
<img src="/shared-assets/images/examples/favicon144.png" alt="MDN" />
```

{{ EmbedLiveSample('Alternative_text', '100%', '160') }}

### Liên kết hình ảnh

Ví dụ này xây dựng dựa trên ví dụ trước, cho thấy cách biến hình ảnh thành liên kết. Để làm vậy, hãy lồng thẻ `<img>` vào bên trong {{HTMLElement("a")}}. Bạn nên làm cho văn bản thay thế mô tả tài nguyên mà liên kết đang trỏ đến, như thể bạn đang sử dụng liên kết văn bản thay thế.

```html
<a href="https://developer.mozilla.org">
  <img
    src="/shared-assets/images/examples/favicon144.png"
    alt="Visit the MDN site" />
</a>
```

{{ EmbedLiveSample('Image_link', '100%', '160') }}

### Sử dụng thuộc tính srcset

Trong ví dụ này, chúng ta bao gồm thuộc tính `srcset` với tham chiếu đến phiên bản độ phân giải cao của logo; điều này sẽ được tải thay vì hình ảnh `src` trên các thiết bị độ phân giải cao. Hình ảnh được tham chiếu trong thuộc tính `src` được tính là ứng viên `1x` trong {{glossary("User agent", "tác nhân người dùng")}} hỗ trợ `srcset`.

```html
<img
  src="/shared-assets/images/examples/favicon72.png"
  alt="MDN"
  srcset="/shared-assets/images/examples/favicon144.png 2x" />
```

{{EmbedLiveSample("Using_the_srcset_attribute", "100%", "160")}}

### Sử dụng các thuộc tính srcset và sizes

Thuộc tính `src` bị bỏ qua trong {{glossary("User agent", "tác nhân người dùng")}} hỗ trợ `srcset` khi mô tả `w` được bao gồm. Khi điều kiện media `(width <= 600px)` khớp, hình ảnh rộng 200 pixel sẽ được tải (đây là hình ảnh phù hợp nhất với `200px`), ngược lại hình ảnh kia sẽ được tải.

```html
<img
  src="clock-demo-200px.png"
  alt="The time is 12:45."
  srcset="clock-demo-200px.png 200w, clock-demo-400px.png 400w"
  sizes="(width <= 600px) 200px, 50vw" />
```

{{EmbedLiveSample("Using_the_srcset_and_sizes_attributes", "100%", 350)}}

> [!NOTE]
> Để thấy thay đổi kích thước đang hoạt động, {{LiveSampleLink('Using_the_srcset_and_sizes_attributes', 'xem ví dụ trên một trang riêng')}}, để bạn có thể thực sự thay đổi kích thước vùng nội dung.

## Mối quan ngại về bảo mật và quyền riêng tư

Mặc dù các phần tử `<img>` có mục đích sử dụng vô hại, chúng có thể gây ra hậu quả không mong muốn cho bảo mật và quyền riêng tư của người dùng. Xem [Tiêu đề Referer: mối quan ngại về quyền riêng tư và bảo mật](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) để biết thêm thông tin và cách giảm thiểu.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#embedded_content"
          >nội dung nhúng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung có thể nhìn thấy</a
        >. Nếu phần tử có thuộc tính <code>usemap</code>, nó cũng là một phần
        của danh mục nội dung tương tác.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là một {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung nhúng.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <ul>
          <li>
            với thuộc tính <code>alt</code> không rỗng hoặc không có
            thuộc tính <code>alt</code>:
            <code
              ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role"
                ><code>img</code></a
              ></code
            >
          </li>
          <li>
            với thuộc tính <code>alt</code> rỗng:
            <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"
              ><code>presentation</code></a
            >
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <ul>
          <li>
            với thuộc tính <code>alt</code> không rỗng:
            <ul>
              <li>
                <code
                  ><a
                    href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"
                    >button</a
                  ></code
                >
              </li>
              <li>
                <code
                  ><a
                    href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role"
                    >checkbox</a
                  ></code
                >
              </li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role"><code>link</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role"><code>menuitem</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role"><code>menuitemcheckbox</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role"><code>menuitemradio</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role"><code>option</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role"><code>progressbar</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role"><code>scrollbar</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role"><code>separator</code></a></li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role"><code>slider</code></a></li>
              <li>
                <code
                  ><a
                    href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role"
                    >switch</a
                  ></code
                >
              </li>
              <li>
                <code
                  ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role"
                    >tab</a
                  ></code
                >
              </li>
              <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role"><code>treeitem</code></a></li>
            </ul>
          </li>
          <li>
            với thuộc tính <code>alt</code> rỗng, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
            hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
          </li>
          <li>
            với không có thuộc tính <code>alt</code>, không có <code>role</code> được phép
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLImageElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("picture")}}, {{HTMLElement("object")}}, và {{HTMLElement("embed")}}
- {{cssxref("object-fit")}}, {{cssxref("object-position")}}, {{cssxref("image-orientation")}}, {{cssxref("image-rendering")}}, và {{cssxref("image-resolution")}}: Các thuộc tính CSS liên quan đến hình ảnh.
- Giao diện {{domxref("HTMLImageElement")}} cho phần tử này
- [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images)
- [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
- [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images)
