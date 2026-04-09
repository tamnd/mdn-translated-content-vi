---
title: Khái niệm video kỹ thuật số
slug: Web/Media/Guides/Formats/Video_concepts
page-type: guide
sidebar: mediasidebar
---

Trong bài viết này, chúng ta sẽ khám phá những khái niệm quan trọng cần hiểu để nắm vững cách làm việc với video trên web.

## Mã hóa màu sắc

Biểu diễn màu trong ảnh hoặc video đòi hỏi nhiều giá trị cho mỗi điểm ảnh. Những giá trị đó phụ thuộc vào cách bạn "tách" màu khi chuyển nó sang dạng số. Có nhiều mô hình màu khác nhau, và codec video sử dụng một hoặc nhiều mô hình trong số đó để biểu diễn các điểm ảnh trong quá trình mã hóa cũng như sau khi giải mã khung hình video.

### RGB

Hầu hết các mô hình đồ họa máy tính sử dụng hệ màu RGB, trong đó một số bit dữ liệu được dùng để biểu diễn từng thành phần đỏ, lục, lam của màu tại một điểm ảnh riêng lẻ, và một ảnh là một mảng hai chiều của các điểm ảnh đó. Có hai phương pháp chính để biểu diễn các mẫu RGB: dùng thành phần số nguyên và dùng thành phần số thực dấu phẩy động. Khi dùng thành phần số nguyên, màu RGB sử dụng 8 bit cho mỗi thành phần đỏ, lục và lam, cùng với có thể thêm 8 bit cho alpha (mức độ trong suốt).

### YUV

Khác với RGB, hệ mã hóa màu **YUV** (hoặc **Y'UV**) dựa trên cách con người cảm nhận một ảnh màu. Nhờ vậy, dữ liệu màu có thể được biểu diễn bằng tổng số bit ít hơn trong một luồng video.

Tên "YUV" ngày nay thường được dùng để mô tả hệ màu này, mặc dù thuật ngữ ban đầu được dùng riêng cho mã hóa màu tương tự, còn **YCbCr** được dùng cho màu số. Tuy nhiên, hiện nay cả hai thuật ngữ đều được dùng cho màu số. Dấu nháy trên ký hiệu, `'`, cho biết rằng đang dùng nén gamma.

#### Suy ngẫm về thị giác con người

Chúng ta có thể biểu diễn ảnh theo cách này vì mắt người nhìn thấy chi tiết ở thang xám nhiều hơn nhiều so với màu sắc, nhờ đặc điểm sinh học. Mắt người chứa hai loại tế bào [photoreceptor](https://en.wikipedia.org/wiki/Photoreceptor_cell) (cảm nhận ánh sáng). **Tế bào que** là các cảm biến cường độ sáng có độ nhạy cao. **Tế bào nón** kém nhạy hơn nhưng có thể phát hiện màu sắc.

Vì mắt có số lượng tế bào que nhiều hơn tế bào nón rất nhiều (khoảng 120 triệu tế bào que so với khoảng 6 hoặc 7 triệu tế bào nón), chúng ta nhìn thấy chi tiết ở thang xám, còn màu sắc thì ít chi tiết hơn nhiều. Về bản chất, mắt chúng ta giống như một máy ảnh có hai chip cảm biến hình ảnh: một cho thang xám và một cho màu. Cảm biến thang xám là 120 megapixel, trong khi cảm biến màu chỉ khoảng 7 megapixel. Các cảm biến này thực tế chiếm cùng một bề mặt, gọi là **[võng mạc](https://en.wikipedia.org/wiki/Visual_system#Retina)**, ở phía sau mắt.

Có ba loại tế bào nón, mỗi loại phản ứng với một dải bước sóng ánh sáng tới nhất định, nhưng cũng phản ứng với cường độ ánh sáng ở bước sóng đó. Vì vậy, mỗi loại tế bào nón ghi nhận các đỉnh phản hồi tương đối ở nhiều bước sóng, và não dùng dữ liệu này để suy ra cường độ và sắc độ của ánh sáng đến vùng võng mạc đó.

Khi mắt chúng ta ghi nhận một cảnh, về cơ bản chúng chụp cùng lúc hai bức ảnh: một ảnh thang xám chi tiết cao và một bản đồ mờ hơn, độ phân giải thấp hơn, của màu sắc ánh sáng nhận được trên võng mạc cùng lúc. Ảnh màu cuối cùng được não tạo ra bằng cách lớp phủ màu lên các điểm ảnh thang xám.

#### Khái niệm YUV

YUV hoạt động bằng cách định nghĩa một không gian màu với ba thành phần:

- Luma (Y')
  - : Độ sáng của điểm ảnh. Nếu không có hai thành phần còn lại, luma của mỗi điểm ảnh trong khung hình sẽ tạo ra một biểu diễn thang xám của ảnh. Trong BT.709 (dùng cho HDTV), ví dụ, giá trị luma là tổng có trọng số của các thành phần đỏ, lục và lam đã hiệu chỉnh gamma của điểm ảnh, theo công thức `Y' = 0.2126R' + 0.7152G' + 0.0722B'`. Việc gán trọng số này được thực hiện vì tỷ lệ tế bào nón lục, đỏ và lam trong mắt đã nêu ở trên.
- Chênh lệch xanh lam (U hoặc Cb)
  - : Thành phần chênh lệch xanh lam của sắc độ, hoặc màu, của mẫu màu. Giá trị này được tính bằng cách lấy giá trị xanh lam đã hiệu chỉnh gamma trừ đi luma; tức là `U = B' - Y'`.
- Chênh lệch đỏ (V hoặc Cr)
  - : Thành phần chênh lệch đỏ của sắc độ của mẫu màu. Được tính bằng cách lấy giá trị đỏ đã hiệu chỉnh gamma trừ đi luma: `V = R' - Y'`.

#### Lấy mẫu sắc độ phụ

**Lấy mẫu sắc độ phụ** là quá trình chuyển các điểm ảnh màu thành một ảnh thang xám và một ma trận giá trị U và V biểu thị màu sẽ ánh xạ vào những điểm ảnh đó.

Vì dữ liệu màu được mã hóa ở độ phân giải thấp hơn luma, nên khi giải mã video để hiển thị lên màn hình, màu của từng điểm ảnh sẽ được tính bằng cách suy ra một màu phù hợp dựa trên các giá trị U và V cho khối 4x2 gồm 8 điểm ảnh mà điểm ảnh đó nằm trong. Phép giải mã này phải phản ánh phương pháp đã dùng khi mã hóa, được biểu diễn bằng ba số ngăn cách bởi dấu hai chấm (`:`).

- Số thứ nhất chỉ số lượng mẫu độ chói trên mỗi hàng được mã hóa từ khối điểm ảnh 4x2. Giá trị này hầu như luôn là 4, nghĩa là "Dùng tất cả các mẫu độ chói."
- Số thứ hai chỉ ra có bao nhiêu mẫu sắc độ được dùng để biểu diễn màu của các điểm ảnh ở hàng đầu tiên.
- Số thứ ba chỉ ra có bao nhiêu mẫu sắc độ được dùng để biểu diễn màu của các điểm ảnh ở hàng thứ hai.

Bảng dưới đây cho thấy ví dụ về ba mô hình lấy mẫu sắc độ phụ.

<table class="standard-table" style="max-width: 46em">
  <thead>
    <tr>
      <th scope="col" style="width: 144px"></th>
      <th scope="col" style="width: 144px">4:2:0</th>
      <th scope="col" style="width: 144px">4:2:2</th>
      <th scope="col" style="width: 144px">4:4:4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="col" style="width: 144px">Độ chói</th>
      <td style="width: 144px; text-align: right">
        <img
          alt="Độ chói của các điểm ảnh trong một khối 4:2 (8 điểm ảnh)"
          src="yuv-luma.svg"
        />
      </td>
      <td style="width: 144px; text-align: right">
        <img
          alt="Độ chói của các điểm ảnh trong một khối 4:2 (8 điểm ảnh)"
          src="yuv-luma.svg"
        />
      </td>
      <td style="width: 144px; text-align: right">
        <img
          alt="Độ chói của các điểm ảnh trong một khối 4:2 (8 điểm ảnh)"
          src="yuv-luma.svg"
        />
      </td>
    </tr>
    <tr>
      <th scope="col" style="width: 144px">Sắc độ (U và V)</th>
      <td style="width: 144px; text-align: right">
        <img alt="Một ma trận giá trị U và V cho thao tác giải mã 4:2:0. Hàng đầu tiên chứa 2 mẫu sắc độ cho U: một xanh lam và một xanh lục. Các mẫu của hàng đầu tiên được sao chép sang hàng thứ hai cho V." src="yuv-chroma-420.svg" />
      </td>
      <td style="width: 144px; text-align: right">
        <img alt="Một ma trận giá trị U và V cho thao tác giải mã 4:2:2. Hàng đầu tiên chứa 2 mẫu sắc độ cho U: một xanh lam và một xanh lục. Hàng thứ hai chứa 2 mẫu sắc độ cho V: một hồng và một vàng." src="yuv-chroma-422.svg" />
      </td>
      <td style="width: 144px; text-align: right">
        <img alt="Một ma trận giá trị U và V cho thao tác giải mã 4:4:4. Hàng đầu tiên chứa 4 mẫu sắc độ cho U: một xanh lam nhạt, một vàng, một xanh lục và một xanh lam đậm. Hàng thứ hai chứa 4 mẫu sắc độ cho V: một hồng, một trắng, một đỏ và một xám." src="yuv-chroma-444.svg" />
      </td>
    </tr>
    <tr>
      <th scope="col" style="width: 144px">Điểm ảnh đã giải mã</th>
      <td style="width: 144px; text-align: right">
        <img alt="Khối điểm ảnh đã giải mã 4:2 sau thao tác giải mã 4:2:0, áp dụng 2 mẫu của ma trận sắc độ cho từng hàng trong khối dữ liệu độ chói. Màu của các mẫu trở nên tối hơn khi áp dụng lên các sắc xám, đen khi áp dụng lên đen hoàn toàn, và không đổi khi áp dụng lên trắng." src="yuv-decoded-420.png" />
      </td>
      <td style="width: 144px; text-align: right">
        <img alt="Khối điểm ảnh đã giải mã 4:2 sau thao tác giải mã 4:2:2, áp dụng 2 mẫu có trong mỗi hàng của ma trận sắc độ cho các hàng tương ứng trong khối dữ liệu độ chói. Màu của các mẫu trở nên tối hơn khi áp dụng lên các sắc xám, đen khi áp dụng lên đen hoàn toàn và không đổi khi áp dụng lên trắng." src="yuv-decoded-422.png" />
      </td>
      <td style="width: 144px; text-align: right">
        <img alt="Khối điểm ảnh đã giải mã 4:2 sau thao tác giải mã 4:4:4, áp dụng 4 mẫu có trong mỗi hàng của ma trận sắc độ cho các hàng tương ứng trong khối dữ liệu độ chói. Màu của các mẫu trở nên tối hơn khi áp dụng lên các sắc xám, đen khi áp dụng lên đen hoàn toàn và không đổi khi áp dụng lên trắng." src="yuv-decoded-444.png" />
      </td>
    </tr>
  </tbody>
</table>

Trong tất cả các trường hợp này, cả bốn điểm ảnh của mỗi hàng trong khối dữ liệu độ chói đều được dùng trong ảnh đã giải mã. Xét lấy mẫu sắc độ phụ 4:2:0, ở cột đầu tiên, giá trị 2 cho biết hàng đầu tiên của dữ liệu sắc độ có hai mẫu; giá trị 0 cho biết hàng thứ hai không có mẫu sắc độ riêng, và các mẫu của hàng đầu tiên phải được sao chép sang hàng thứ hai. Nói cách khác, chúng ta lấy thông tin màu từ mỗi hàng điểm ảnh xen kẽ trong ảnh nguồn và áp dụng nó lên ảnh thang xám được biểu diễn bởi luma.

Cột thứ hai cho thấy lấy mẫu 4:2:2. Hàng trên cùng của bốn mẫu luma có hai mẫu sắc độ được áp dụng, và hàng dưới của luma cũng có hai mẫu được áp dụng. Vậy tám điểm ảnh được biểu diễn bởi khối này có bốn mẫu sắc độ dùng chung giữa chúng.

Ví dụ cuối cùng minh họa lấy mẫu 4:4:4. Có bốn mẫu luma ở mỗi hàng và bốn mẫu sắc độ ở mỗi hàng, vì vậy mọi điểm ảnh được biểu diễn bởi khối đều được tô màu riêng biệt.

Điều gì xảy ra nếu mô hình lấy mẫu sắc độ là 4:0:0? Điều đó có nghĩa là dùng mọi điểm ảnh của dữ liệu luma, nhưng mỗi hàng có 0 mẫu sắc độ được áp dụng. Kết quả là ảnh chỉ gồm dữ liệu độ chói - một ảnh thang xám.

#### Biểu diễn dữ liệu YUV

Vì ảnh được biểu diễn với nhiều chi tiết hơn ở thang xám so với màu sắc, các giá trị Y', U và V thường không được lưu cùng nhau, một mẫu cho mỗi điểm ảnh, như cách ảnh RGB được lưu trong bộ nhớ.

- Mỗi khung hình video được biểu diễn bởi một ma trận giá trị luma, Y, còn màu của từng điểm ảnh được tính bằng các giá trị trong ma trận U và V. Ví dụ, trong codec AV1, một bản ghi lưu luma đã mã hóa cho một tile, và bản ghi thứ hai chứa dữ liệu sắc độ dưới dạng các giá trị U và V.
- Trong truyền hình phát sóng, tín hiệu luma là tín hiệu chính, còn dữ liệu chrominance được gửi trên một sóng mang phụ.
- Cách nén của kiểu tệp {{Glossary("JPEG")}} hoạt động bằng cách đầu tiên chuyển ảnh sang hệ màu Y'UV, rồi nén dữ liệu đó. Mỗi giá trị Y', Cb và Cr đều có thể nằm trong khoảng từ 0 đến 255.
