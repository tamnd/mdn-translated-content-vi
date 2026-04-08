---
title: Using color wisely
slug: Web/CSS/Guides/Colors/Using_color_wisely
page-type: guide
sidebar: cssref
---

Chọn màu sắc đúng cho một trang web có thể khó khăn, đặc biệt nếu bạn không có nền tảng vững về nghệ thuật, thiết kế, hoặc ít nhất là lý thuyết màu sắc cơ bản. Chọn màu sai có thể làm trang web trông kém hấp dẫn, hoặc tệ hơn, khiến nội dung không đọc được do vấn đề về độ tương phản hay các màu xung đột. Sử dụng màu sắc sai có thể khiến nội dung của bạn hoàn toàn không thể sử dụng được với những người có vấn đề về thị lực nhất định, đặc biệt là mù màu.

## Tìm màu sắc phù hợp

Có các công cụ và quy trình sẵn có để giúp bạn chọn bảng màu tốt. Mặc dù chúng không thể thay thế việc có một nhà thiết kế giỏi giúp bạn đưa ra các quyết định này, nhưng chúng có thể giúp bạn bắt đầu.

### Màu cơ sở

Bước đầu tiên là chọn **màu cơ sở** của bạn. Màu này đại diện cho trang web hoặc chủ đề của nó. Giống như chúng ta liên tưởng màu lục với đồ uống [Mountain Dew](https://en.wikipedia.org/wiki/Mountain_Dew) hay màu lam với bầu trời hay đại dương, chọn một màu cơ sở phù hợp để đại diện cho trang web của bạn là điểm xuất phát tốt. Có nhiều cách để chọn màu cơ sở; một vài gợi ý bao gồm:

- Một màu gắn liền tự nhiên với chủ đề nội dung của bạn, chẳng hạn như màu hiện có được xác định với sản phẩm hay ý tưởng hoặc màu đại diện cho cảm xúc bạn muốn truyền đạt.
- Một màu đến từ hình ảnh liên quan đến chủ đề của bạn. Nếu bạn tạo trang web về một vật phẩm hay sản phẩm cụ thể, hãy chọn màu hiện diện vật lý trên vật phẩm đó.
- Duyệt các trang web cho phép bạn xem nhiều bảng màu và hình ảnh hiện có để tìm cảm hứng.

Một số extension trình duyệt hữu ích có thể giúp chọn màu cơ sở. Ví dụ, extension trình duyệt [ColorZilla](https://www.colorzilla.com/) cung cấp công cụ eyedropper để chọn màu từ bất kỳ trang web nào. Nó cũng có thể tính trung bình các màu của một vùng trên trang.

Việc lấy "màu trung bình" rất hữu ích vì đôi khi thứ trông như một khối màu đồng nhất thực ra có thể là nhiều màu liên quan, chẳng hạn như lấy màu lam trong một bức ảnh chụp đại dương hay bầu trời. Một pixel lam được chọn từ ảnh có thể tạo ra màu trông không phù hợp.

### Xây dựng bảng màu

Sau khi quyết định về màu cơ sở, bước tiếp theo là xây dựng bảng màu phù hợp để sử dụng cùng với nó. Một số công cụ có sẵn để áp dụng lý thuyết màu sắc vào màu cơ sở của bạn và xuất ra các màu bổ sung phù hợp. Các công cụ trực tuyến, như [Adobe Color CC online color wheel](https://color.adobe.com/create/color-wheel) miễn phí có thể giúp bạn chọn bảng màu tiếp cận được.

Nhiều công cụ trong số này cũng có thể áp dụng bộ lọc vào bảng màu để bạn có thể xem chúng trông như thế nào với những người có các dạng mù màu khác nhau. Xem [Màu sắc và khả năng tiếp cận](#color_and_accessibility) để biết giải thích ngắn gọn về lý do điều này quan trọng.

Khi thiết kế bảng màu, bạn cũng có thể cần bổ sung một số màu trung tính cơ bản như trắng (hoặc gần trắng), đen (hoặc gần đen), và một hoặc nhiều sắc thái xám.

> [!NOTE]
> Thông thường, bạn nên sử dụng ít màu sắc nhất có thể. Sử dụng màu sắc để làm nổi bật nội dung quan trọng thay vì thêm màu vào mọi thứ sẽ có tác động nhiều hơn và nội dung của bạn sẽ dễ đọc hơn.

## Tài nguyên lý thuyết màu sắc

Việc xem xét đầy đủ lý thuyết màu sắc nằm ngoài phạm vi của bài viết này, tuy nhiên có nhiều bài viết về lý thuyết màu sắc sẵn có. Chúng tôi thấy các tài nguyên sau đặc biệt hữu ích:

- [Color Science](https://www.khanacademy.org/computing/pixar/color) ([Khan Academy](https://www.khanacademy.org/) kết hợp với [Pixar](https://www.pixar.com/))
  - : Khóa học trực tuyến giới thiệu các khái niệm như màu sắc là gì, cách nó được nhận thức, và cách sử dụng màu sắc để diễn đạt ý tưởng. Được trình bày bởi các nghệ sĩ và nhà thiết kế Pixar.
- [Color theory](https://en.wikipedia.org/wiki/Color_theory) trên Wikipedia
  - : Mục về lý thuyết màu sắc của Wikipedia có thông tin tuyệt vời từ góc độ kỹ thuật. Nó có thể không giúp quá trình chọn màu của bạn, nhưng vẫn đầy thông tin hữu ích.

## Màu sắc và khả năng tiếp cận

Hãy đảm bảo nội dung của bạn [có thể tiếp cận](/en-US/docs/Web/Accessibility). Có nhiều cách màu sắc có thể tạo ra vấn đề {{Glossary("accessibility", "khả năng tiếp cận")}}. Việc sử dụng màu sắc không đúng hoặc cẩu thả có thể dẫn đến một trang web hay ứng dụng mà một phần trăm đối tượng mục tiêu của bạn có thể không sử dụng được đầy đủ, dẫn đến mất lượng truy cập, mất kinh doanh, và có thể thậm chí là vấn đề quan hệ công chúng hay kiện tụng. Vì vậy, điều quan trọng là phải cân nhắc kỹ việc sử dụng màu sắc của bạn.

Điều quan trọng là phải [hiểu màu sắc và luminance](/en-US/docs/Web/Accessibility/Guides/Colors_and_Luminance) và luôn xem xét [mù màu](https://medlineplus.gov/colorblindness.html) và [rối loạn tiền đình](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders). Có một số loại; phổ biến nhất là mù màu đỏ-lục, khiến người ta không thể phân biệt giữa màu đỏ và lục. Ngoài ra còn có các loại khác, từ không thể phân biệt sự khác biệt giữa một số màu đến hoàn toàn không thể nhìn thấy màu sắc. Thậm chí có những kết hợp màu sắc và hoạt hình có thể khiến người dùng nhạy cảm với ánh sáng bị [co giật](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders#colors).

Mặc dù [độ tương phản màu](https://digital.gov/guides/accessibility-for-teams/visual-design/#color-and-contrast) cao hơn thường tốt cho khả năng tiếp cận, khi hoạt hình, đặc biệt là nhanh, [giảm độ tương phản màu](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders#reduce_contrast) trên các phần tử hoạt hình làm giảm nguy cơ co giật. Nếu bạn bao gồm hoạt hình, hãy sử dụng tính năng truy vấn media [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) {{cssxref("@media")}} để giảm hoạt hình cho người dùng đã chọn tùy chọn đó.

Dù vậy, hãy đảm bảo bạn có đủ [độ tương phản màu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) giữa nội dung nền và tiền cảnh để đảm bảo khả năng đọc được. Ngoài ra, đừng bao giờ sử dụng màu sắc là cách duy nhất để truyền đạt thông tin. Ví dụ, nếu bạn chỉ ra sự thành công của một thao tác bằng viền lục xung quanh phần tử UI liên quan, và thất bại bằng viền đỏ, những người dùng mù màu đỏ-lục sẽ không thể sử dụng trang web của bạn đúng cách. Thay vào đó, hãy sử dụng văn bản và chỉ báo màu cùng nhau để bao gồm những người dùng đó. Ví dụ, dấu kiểm lục và dấu chéo đỏ sẽ tốt hơn.

## Ví dụ thiết kế bảng màu

Trong ví dụ này, chúng ta sẽ tạo bảng màu phù hợp cho một trang web về trò chơi diễn ra trên hành tinh Sao Hỏa. [Tìm kiếm Google cho ảnh Sao Hỏa](https://www.google.com/search?q=Mars&tbm=isch) sẽ xuất ra nhiều ảnh màu.

Sử dụng công cụ color picker để chọn màu mẫu cho màu cơ sở. Trong ví dụ này, chúng ta đã chọn `#D79C7A`, là màu cam đỏ gỉ. Chúng ta có thể sử dụng [Paletton](https://www.paletton.com/) để đề xuất các màu khác cho bảng màu của chúng ta. Khi mở Paletton, chúng ta thấy:

![Ngay sau khi tải Paletton.](paletton1.png)

Tiếp theo, chúng ta nhập mã hex của màu (`D79C7A`) vào hộp "Base RGB" ở góc dưới bên trái của công cụ:

![Sau khi nhập màu cơ sở](paletton2.png)

Chúng ta giờ thấy một bảng màu đơn sắc dựa trên màu chúng ta đã chọn từ ảnh Sao Hỏa. Nếu bạn cần các màu liên quan, đây có thể là các tùy chọn tốt. Để tìm màu nhấn nổi bật cùng với màu cơ sở, chúng ta nhấn vào nút bật tắt "add complementary" bên dưới menu cho phép bạn chọn kiểu bảng màu. Mặc định là "Monochromatic". Paletton tính toán màu nhấn phù hợp; nhấp vào màu nhấn ở góc dưới bên phải cho chúng ta biết màu này là `#508D7C`.

![Giờ có thêm màu bổ sung.](paletton3.png)

Nếu màu được đề xuất không phù hợp với nhu cầu của bạn, bạn có thể thay đổi bảng màu. Ví dụ, nếu màu xanh lục lam được đề xuất không phù hợp, hãy chọn biểu tượng bảng màu Triad, dẫn đến kết quả sau:

![Đã chọn bảng màu Triad](paletton4.png)

Nhấp vào màu xanh xám ở góc trên bên phải. Màu là `#556E8D`. Đây có thể được dùng làm màu nhấn để làm nổi bật mọi thứ, chẳng hạn như cho tiêu đề, điểm nổi bật tab, hoặc các chỉ báo khác trên trang:

![Đã chọn bảng màu Triad](paletton-color-detail.png)

Bây giờ chúng ta có màu cơ sở và màu nhấn của mình. Chúng ta cũng có một vài sắc thái bổ sung của cả hai, có thể được sử dụng để tạo gradient hoặc làm màu nhấn để chỉ ra tiêu điểm, chẳng hạn như trạng thái hover của liên kết. Các màu có thể được xuất theo nhiều định dạng để sử dụng.

Bạn cũng nên chọn màu trung tính. Tìm màu có đủ độ tương phản để văn bản của bạn rõ ràng và dễ đọc trong khi đảm bảo không quá chói mắt. Nếu độ tương phản quá thấp, văn bản sẽ bị mờ bởi nền, khiến nó không đọc được, nhưng nếu độ tương phản quá cao, người dùng có thể thấy trang web của bạn quá tương phản và khó nhìn.

## Màu sắc, nền, độ tương phản, và in ấn

Trang web của bạn có thể trông rất khác khi in so với những gì người dùng thấy trên màn hình.
Khi in trang, người dùng có thể chọn in chỉ đen trắng. Hầu hết các trình duyệt, theo mặc định, loại bỏ màu nền và hình ảnh khi in tài liệu.

Điều quan trọng nhất thường là chính văn bản, nhưng nếu màu nền và hình ảnh của bạn đã được chọn cẩn thận và/hoặc có vai trò quan trọng đối với tính hữu dụng của nội dung, bạn có thể dùng thuộc tính CSS {{cssxref("print-color-adjust")}} để yêu cầu trình duyệt không thực hiện các điều chỉnh đối với giao diện của nội dung.

Giá trị mặc định `print-color-adjust: economy`, cho biết trình duyệt được phép thực hiện các thay đổi giao diện như nó thấy cần thiết để cố gắng tối ưu hóa khả năng đọc và/hoặc tiết kiệm in ấn của nội dung, theo loại thiết bị đầu ra mà tài liệu đang được hiển thị.

Bạn có thể đặt `print-color-adjust: exact` để yêu cầu trình duyệt rằng phần tử hoặc các phần tử mà bạn sử dụng trên chúng đã được thiết kế đặc biệt để hoạt động tốt nhất với các màu và hình ảnh được giữ nguyên.
Với thiết lập này, trình duyệt sẽ không can thiệp vào giao diện của phần tử mà giá trị này được áp dụng, và sẽ vẽ nó như được chỉ định bởi CSS của bạn.

> [!NOTE]
> Tuy nhiên, không có gì đảm bảo rằng `print-color-adjust: exact` sẽ dẫn đến việc CSS của bạn được sử dụng chính xác như đã cho.
> Nếu trình duyệt cung cấp tùy chọn người dùng để thay đổi đầu ra (chẳng hạn như hộp kiểm "don't print backgrounds" trong hộp thoại in), điều đó sẽ ghi đè giá trị của `print-color-adjust`.

## Xem thêm

- [CSS colors](/en-US/docs/Web/CSS/Guides/Colors) module
- [Applying color to HTML elements using CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- [CSS color values](/en-US/docs/Web/CSS/Guides/Colors/Color_values)
- [Using relative colors](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- [Understanding color and luminance](/en-US/docs/Web/Accessibility/Guides/Colors_and_Luminance)
- [WCAG 1.4.1: Color contrast](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
- [Paletton](https://paletton.com/)
