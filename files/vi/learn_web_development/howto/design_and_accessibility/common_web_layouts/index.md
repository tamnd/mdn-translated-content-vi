---
title: What do common web layouts contain?
slug: Learn_web_development/Howto/Design_and_accessibility/Common_web_layouts
page-type: learn-faq
sidebar: learn-how-to
---

Khi thiết kế các trang cho website của bạn, thật tốt khi có ý tưởng về các bố cục phổ biến nhất.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hãy đảm bảo bạn đã suy nghĩ về
        <a href="/en-US/docs/Learn_web_development/Howto/Design_and_accessibility/Thinking_before_coding"
          >những gì bạn muốn hoàn thành</a
        >
        với dự án web của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu nơi đặt mọi thứ trên các trang web của bạn và cách đặt chúng ở đó.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Có lý do để chúng ta nói về thiết kế web. Bạn bắt đầu với một trang trắng, và bạn có thể đi theo nhiều hướng. Và nếu bạn không có nhiều kinh nghiệm, bắt đầu với một trang trắng có thể hơi đáng sợ. Chúng tôi có hơn 25 năm kinh nghiệm và chúng tôi sẽ cung cấp cho bạn một số quy tắc ngón tay cái phổ biến để giúp bạn thiết kế site của mình.

Ngay cả bây giờ với sự tập trung mới vào Web di động, hầu hết tất cả các trang web chính thống đều được xây dựng từ những phần này:

- Tiêu đề (Header)
  - : Hiển thị ở đầu mỗi trang trên site. Chứa thông tin liên quan đến tất cả các trang (như tên site hoặc logo) và hệ thống điều hướng dễ sử dụng.
- Nội dung chính
  - : Khu vực lớn nhất, chứa nội dung duy nhất của trang hiện tại.
- Nội dung bên cạnh
  - : 1) Thông tin bổ sung cho nội dung chính; 2) thông tin được chia sẻ giữa một tập hợp con các trang; 3) hệ thống điều hướng thay thế. Về cơ bản, mọi thứ không thực sự cần thiết cho nội dung chính của trang.
- Chân trang (Footer)
  - : Hiển thị ở cuối mỗi trang trên site. Giống như tiêu đề, chứa thông tin toàn cục ít nổi bật hơn như thông báo pháp lý hoặc thông tin liên hệ.

Các yếu tố này khá phổ biến trong tất cả các yếu tố hình thức, nhưng chúng có thể được bố trí theo những cách khác nhau. Dưới đây là một số ví dụ (**1** đại diện tiêu đề, **2** chân trang; **A** nội dung chính; **B1, B2** nội dung bên cạnh):

**Bố cục 1 cột**. Đặc biệt quan trọng cho trình duyệt di động để bạn không làm lộn xộn màn hình nhỏ.

![Ví dụ về bố cục 1 cột: Nội dung chính ở trên và các phần bên xếp chồng lên bên dưới.](1-col-layout.png)

**Bố cục 2 cột**. Thường được sử dụng cho máy tính bảng, vì chúng có màn hình kích thước trung bình.

![Ví dụ về bố cục 2 cột cơ bản: Một phần bên ở cột trái, và nội dung chính ở cột phải.](2-col-layout-right.png) ![Ví dụ về bố cục 2 cột cơ bản: Một phần bên ở cột phải, và nội dung chính ở cột trái.](2-col-layout-left.png)

**Bố cục 3 cột**. Chỉ phù hợp cho máy tính để bàn với màn hình lớn. (Thậm chí nhiều người dùng máy tính để bàn thích xem mọi thứ trong các cửa sổ nhỏ hơn là toàn màn hình.)

![Ví dụ về bố cục 3 cột cơ bản: Phần bên ở cột trái và phải, Nội dung chính ở cột giữa.](3-col-layout.png) ![Ví dụ khác về bố cục 3 cột: Phần bên cạnh nhau ở bên trái, Nội dung chính ở cột phải.](3-col-layout-alt.png) ![Ví dụ khác về bố cục 3 cột: Phần bên cạnh nhau ở bên phải, Nội dung chính ở cột trái.](3-col-layout-alt2.png)

Điều thú vị thực sự bắt đầu khi bạn bắt đầu kết hợp tất cả chúng lại với nhau:

![Ví dụ về bố cục hỗn hợp: Nội dung chính ở trên và các phần bên cạnh nhau bên dưới.](1-col-layout-alt.png) ![Ví dụ về bố cục hỗn hợp: Nội dung chính ở cột trái và các phần xếp chồng ở cột phải](2-col-layout-left-alt.png) ![Ví dụ về bố cục hỗn hợp: một phần bên ở cột trái và nội dung chính ở cột phải với một phần bên bên dưới nội dung chính.](2-col-layout-mix.png) ![Ví dụ về bố cục hỗn hợp: Nội dung chính ở bên trái hàng đầu tiên và một phần bên ở bên phải của cùng hàng đó, một phần thứ hai bao phủ toàn bộ hàng thứ hai.](2-col-layout-mix-alt.png)…

Đây chỉ là các ví dụ và bạn hoàn toàn tự do bố trí mọi thứ theo cách bạn muốn. Bạn có thể nhận thấy rằng, trong khi nội dung có thể di chuyển trên màn hình, chúng ta luôn giữ tiêu đề (1) ở trên cùng và chân trang (2) ở dưới cùng. Ngoài ra, nội dung chính (A) quan trọng nhất, vì vậy hãy dành cho nó nhiều không gian nhất.

Đây là các quy tắc ngón tay cái mà bạn có thể dựa vào. Tất nhiên có các thiết kế phức tạp và ngoại lệ. Trong các bài viết khác, chúng ta sẽ thảo luận về cách thiết kế các site đáp ứng (các site thay đổi tùy thuộc vào kích thước màn hình) và các site có bố cục khác nhau giữa các trang. Bây giờ, tốt nhất là giữ bố cục nhất quán trên toàn site của bạn.

## Tìm hiểu sâu hơn

Hãy nghiên cứu một số ví dụ cụ thể hơn được lấy từ các website nổi tiếng.

### Bố cục một cột

Một bố cục một cột điển hình cung cấp tất cả thông tin theo dạng tuyến tính trên một trang.

![Ví dụ về bố cục 1 cột trong thực tế](screenshot-product.jpg) ![Bố cục 1 cột với tiêu đề, nội dung chính, một chồng nội dung bên cạnh và chân trang](screenshot-product-overlay.jpg)

Khá đơn giản. Chỉ cần nhớ, nhiều người vẫn sẽ duyệt site của bạn từ máy tính để bàn, vì vậy hãy làm cho nội dung của bạn có thể sử dụng/đọc được ở đó cũng.

### Bố cục hai cột

Các blog thường có hai cột, một cột rộng cho nội dung chính và một cột mỏng cho những thứ bên cạnh (như widget, cấp điều hướng thứ cấp và quảng cáo).

![Ví dụ về bố cục 2 cột cho blog](screenshot-blog.jpg) ![Bố cục 2 cột với nội dung chính ở cột trái](screenshot-blog-overlay.jpg)

Trong ví dụ này, hãy nhìn vào hình ảnh (B1) ngay bên dưới tiêu đề. Nó liên quan đến nội dung chính, nhưng nội dung chính có ý nghĩa mà không cần nó, vì vậy bạn có thể nghĩ hình ảnh là nội dung chính hoặc nội dung bên cạnh. Điều đó không thực sự quan trọng. Điều quan trọng là, nếu bạn đặt gì đó ngay dưới tiêu đề, nó nên là nội dung chính hoặc _liên quan trực tiếp_ đến nội dung chính.

### Đây là bẫy

**[MICA](https://www.mica.edu/about-mica/)**. Cái này khó hơn một chút. Nó trông giống như bố cục ba cột:

![Ví dụ về bố cục 3 cột giả](screenshot-education.jpg) ![Nó trông giống như bố cục 3 cột nhưng thực ra, nội dung bên cạnh đang nổi xung quanh.](screenshot-education-overlay.jpg)

Nhưng không phải! B1 và B2 nổi xung quanh nội dung chính. Hãy nhớ từ "float" — nó sẽ gợi lên ký ức khi bạn bắt đầu học về {{Glossary("CSS")}}.

Tại sao bạn lại nghĩ đó là bố cục ba cột? Vì hình ảnh ở trên bên phải có hình dạng chữ L, vì B1 trông giống như một cột hỗ trợ nội dung chính bị dịch chuyển, và vì chữ "M" và "I" của logo MICA tạo ra một đường lực thẳng đứng.

Đây là một ví dụ tốt về bố cục cổ điển hỗ trợ một số sáng tạo thiết kế. Các bố cục đơn giản dễ triển khai hơn, nhưng hãy cho phép bản thân có không gian để thể hiện sự sáng tạo trong lĩnh vực này.

### Bố cục phức tạp hơn nhiều

**Nhà hát Opera Paris**.

![Ví dụ về bố cục phức tạp.](screenshot-opera.jpg) ![Đây là bố cục 2 cột nhưng tiêu đề chồng lên nội dung chính.](screenshot-opera-overlay.jpg)

Về cơ bản là bố cục hai cột, nhưng bạn sẽ nhận thấy nhiều điều chỉnh ở đây và ở đó làm phá vỡ bố cục về mặt trực quan. Đặc biệt, tiêu đề chồng lên hình ảnh của nội dung chính. Cách đường cong của menu tiêu đề liên kết với đường cong ở dưới cùng của hình ảnh, tiêu đề và nội dung chính trông giống như một thứ dù về mặt kỹ thuật chúng hoàn toàn khác nhau. Ví dụ Opera trông phức tạp hơn ví dụ MICA, nhưng thực ra dễ triển khai hơn (được rồi, "dễ" _là_ một khái niệm tương đối).

Như bạn thấy, bạn có thể tạo ra các website ấn tượng ngay cả với các bố cục cơ bản. Hãy nhìn vào các website yêu thích của chính bạn và tự hỏi, tiêu đề ở đâu, chân trang ở đâu, nội dung chính ở đâu, và nội dung bên cạnh ở đâu? Điều đó sẽ truyền cảm hứng cho thiết kế của bạn và cung cấp cho bạn những gợi ý tốt về những thiết kế nào hoạt động và những thiết kế nào không.
