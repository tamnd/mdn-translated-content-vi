---
title: <length>
slug: Web/CSS/Reference/Values/length
page-type: css-type
browser-compat: css.types.length
sidebar: cssref
---

Kiểu dữ liệu **`<length>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho một giá trị khoảng cách. Độ dài có thể được dùng trong nhiều thuộc tính CSS, chẳng hạn như {{Cssxref("width")}}, {{Cssxref("height")}}, {{Cssxref("margin")}}, {{Cssxref("padding")}}, {{Cssxref("border-width")}}, {{Cssxref("font-size")}} và {{Cssxref("text-shadow")}}.

> [!NOTE]
> Mặc dù các giá trị {{cssxref("&lt;percentage&gt;")}} có thể dùng trong một số thuộc tính cũng chấp nhận giá trị `<length>`, nhưng chúng không phải là giá trị `<length>`. Xem {{cssxref("&lt;length-percentage&gt;")}}.

## Cú pháp

Kiểu dữ liệu `<length>` bao gồm một {{cssxref("&lt;number&gt;")}} theo sau bởi một trong các đơn vị được liệt kê bên dưới. Như với tất cả các chiều CSS, không có khoảng trắng giữa số và đơn vị. Việc chỉ định đơn vị độ dài là tùy chọn nếu số là `0`.

> [!NOTE]
> Một số thuộc tính cho phép giá trị `<length>` âm, trong khi những thuộc tính khác thì không.

[Giá trị được chỉ định](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#specified_value) của một độ dài (_độ dài được chỉ định_) được biểu diễn bởi số lượng và đơn vị của nó. [Giá trị tính toán](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của một độ dài (_độ dài tính toán_) là độ dài được chỉ định được giải thành một độ dài tuyệt đối, và đơn vị của nó không được phân biệt.

Các đơn vị `<length>` có thể là tương đối hoặc tuyệt đối. Độ dài tương đối biểu diễn một phép đo theo một khoảng cách khác. Tùy thuộc vào đơn vị, khoảng cách này có thể là kích thước của một ký tự cụ thể, [chiều cao dòng](/vi/docs/Web/CSS/Reference/Properties/line-height), hoặc kích thước của {{Glossary("viewport")}}. Các bảng kiểu sử dụng đơn vị độ dài tương đối có thể dễ dàng thu phóng từ môi trường đầu ra này sang môi trường khác.

> [!NOTE]
> Các phần tử con không kế thừa các giá trị tương đối như được chỉ định cho phần tử cha của chúng; chúng kế thừa các giá trị tính toán.

## Đơn vị độ dài tương đối

Các đơn vị độ dài tương đối CSS dựa trên kích thước phông chữ, container hoặc viewport.

### Đơn vị độ dài tương đối dựa trên phông chữ

Độ dài phông chữ định nghĩa giá trị `<length>` theo kích thước của một ký tự cụ thể hoặc thuộc tính phông chữ trong phông chữ đang có hiệu lực trong một phần tử hoặc phần tử cha của nó.

> [!NOTE]
> Các đơn vị này, đặc biệt là `em` và `rem` tương đối với gốc, thường được dùng để tạo các bố cục có thể thu phóng, duy trì nhịp điệu dọc của trang ngay cả khi người dùng thay đổi cỡ chữ.

- `cap`
  - : Bằng "chiều cao cap" (chiều cao danh nghĩa của chữ hoa) của {{Cssxref("font")}} của phần tử.
- `ch`
  - : Biểu diễn chiều rộng, hay chính xác hơn là {{Glossary("advance measure")}} của ký tự `0` (số không, ký tự Unicode U+0030) trong {{Cssxref("font")}} của phần tử.
    Trong trường hợp không thể hoặc không thực tế để xác định số đo của ký tự `0`, phải giả định rằng nó rộng `0.5em` và cao `1em`.
- `em`
  - : Biểu diễn {{Cssxref("font-size")}} được tính toán của phần tử. Nếu được dùng trên chính thuộc tính {{Cssxref("font-size")}}, nó biểu diễn cỡ chữ _kế thừa_ của phần tử.
- `ex`
  - : Bằng [chiều cao x](https://en.wikipedia.org/wiki/X-height) của {{Cssxref("font")}} của phần tử. Trong các phông chữ có chữ `x`, đây thường là chiều cao của các chữ thường trong phông chữ; `1ex ≈ 0.5em` trong nhiều phông chữ.
- `ic`
  - : Biểu diễn {{Glossary("advance measure")}} được sử dụng của ký tự "水" (chữ tượng hình nước CJK, U+6C34), có trong phông chữ được dùng để hiển thị nó.
- `lh`
  - : Bằng giá trị tính toán của thuộc tính {{Cssxref("line-height")}} của phần tử mà nó được dùng, chuyển đổi thành độ dài tuyệt đối. Đơn vị này cho phép tính toán độ dài dựa trên kích thước lý thuyết của một dòng trống lý tưởng. Tuy nhiên, kích thước của các hộp dòng thực tế có thể khác nhau dựa trên nội dung của chúng.

### Đơn vị độ dài tương đối dựa trên phông chữ của phần tử gốc

Các đơn vị độ dài tương đối với phông chữ của phần tử gốc định nghĩa giá trị `<length>` theo kích thước của một ký tự cụ thể hoặc thuộc tính phông chữ của phần tử [gốc](/vi/docs/Web/CSS/Reference/Selectors/:root):

- `rcap`
  - : Bằng "chiều cao cap" (chiều cao danh nghĩa của chữ hoa) của {{Cssxref("font")}} của phần tử gốc.
- `rch`
  - : Bằng chiều rộng hoặc {{Glossary("advance measure")}} của ký tự `0` (số không, ký tự Unicode U+0030) trong {{Cssxref("font")}} của phần tử gốc.
- `rem`
  - : Biểu diễn {{Cssxref("font-size")}} của phần tử gốc (thường là {{HTMLElement("html")}}). Khi được dùng bên trong {{Cssxref("font-size")}} của phần tử gốc, nó biểu diễn giá trị khởi tạo của nó. Giá trị mặc định thông thường của trình duyệt là `16px`, nhưng tùy chọn do người dùng định nghĩa có thể thay đổi điều này.
- `rex`
  - : Bằng chiều cao x của {{Cssxref("font")}} của phần tử gốc.
- `ric`
  - : Bằng giá trị của đơn vị [`ic`](#ic) trên phông chữ của phần tử gốc.
- `rlh`
  - : Bằng giá trị của đơn vị [`lh`](#lh) trên phông chữ của phần tử gốc. Đơn vị này cho phép tính toán độ dài dựa trên kích thước lý thuyết của một dòng trống lý tưởng. Tuy nhiên, kích thước của các hộp dòng thực tế có thể khác nhau dựa trên nội dung của chúng.

### Đơn vị độ dài tương đối dựa trên viewport

Các **đơn vị độ dài theo phần trăm viewport** dựa trên bốn kích thước viewport khác nhau: nhỏ, lớn, động và mặc định. Việc cho phép các kích thước viewport khác nhau là để phản hồi với các giao diện trình duyệt mở rộng và thu hẹp động và ẩn hiện nội dung bên dưới.

- **Đơn vị viewport nhỏ**
  - : Khi bạn muốn viewport nhỏ nhất có thể để phản hồi với các giao diện trình duyệt mở rộng động, bạn nên dùng kích thước viewport nhỏ. Kích thước viewport nhỏ cho phép nội dung bạn thiết kế lấp đầy toàn bộ viewport khi các giao diện trình duyệt được mở rộng. Việc chọn kích thước này cũng có thể để lại khoảng trống khi các giao diện trình duyệt thu lại.

    Ví dụ, một phần tử được đặt kích thước bằng các đơn vị theo phần trăm viewport dựa trên kích thước viewport nhỏ, phần tử đó sẽ lấp đầy màn hình hoàn hảo mà không có nội dung nào bị che khuất khi tất cả các giao diện trình duyệt động được hiển thị. Tuy nhiên, khi các giao diện trình duyệt đó được ẩn đi, có thể có thêm khoảng trống xung quanh phần tử. Do đó, các đơn vị theo phần trăm viewport nhỏ "an toàn hơn" để dùng nói chung, nhưng có thể không tạo ra bố cục hấp dẫn nhất sau khi người dùng bắt đầu tương tác với trang.

    Kích thước viewport nhỏ được biểu diễn bởi tiền tố `sv` và tạo ra các đơn vị độ dài theo phần trăm viewport `sv*`. Kích thước của các đơn vị theo phần trăm viewport nhỏ là cố định, và do đó ổn định, trừ khi chính viewport được thay đổi kích thước.

- **Đơn vị viewport lớn**
  - : Khi bạn muốn viewport lớn nhất có thể để phản hồi với các giao diện trình duyệt thu lại động, bạn nên dùng kích thước viewport lớn. Kích thước viewport lớn cho phép nội dung bạn thiết kế lấp đầy toàn bộ viewport khi các giao diện trình duyệt đang thu lại. Bạn cần lưu ý rằng nội dung có thể bị ẩn khi các giao diện trình duyệt mở rộng.

    Ví dụ, trên điện thoại di động nơi không gian màn hình rất quý giá, các trình duyệt thường ẩn một phần hoặc toàn bộ thanh tiêu đề và địa chỉ sau khi người dùng bắt đầu cuộn trang. Khi một phần tử được đặt kích thước bằng đơn vị theo phần trăm viewport dựa trên kích thước viewport lớn, nội dung của phần tử đó sẽ lấp đầy toàn bộ trang hiển thị khi các giao diện trình duyệt này bị ẩn. Tuy nhiên, khi các giao diện trình duyệt có thể thu lại này được hiển thị, chúng có thể ẩn nội dung được đặt kích thước hoặc định vị bằng các đơn vị theo phần trăm viewport _lớn_.

    Đơn vị viewport lớn được biểu diễn bởi tiền tố `lv` và tạo ra các đơn vị theo phần trăm viewport `lv*`. Kích thước của các đơn vị theo phần trăm viewport lớn là cố định và do đó ổn định, trừ khi chính viewport được thay đổi kích thước.

- **Đơn vị viewport động**
  - : Khi bạn muốn viewport tự động điều chỉnh kích thước để phản hồi với các giao diện trình duyệt mở rộng hoặc thu lại động, bạn có thể dùng kích thước viewport động. Kích thước viewport động cho phép nội dung bạn thiết kế vừa khít với viewport, bất kể sự hiện diện của các giao diện trình duyệt động.

    Đơn vị viewport động được biểu diễn bởi tiền tố `dv` và tạo ra các đơn vị theo phần trăm viewport `dv*`. Kích thước của các đơn vị theo phần trăm viewport động không ổn định, ngay cả khi bản thân viewport không thay đổi.

    > [!NOTE]
    > Mặc dù kích thước viewport động có thể cung cấp cho bạn nhiều kiểm soát và linh hoạt hơn, việc sử dụng các đơn vị theo phần trăm viewport dựa trên kích thước viewport động có thể khiến nội dung thay đổi kích thước khi người dùng cuộn trang. Điều này có thể dẫn đến suy giảm giao diện người dùng và gây ra ảnh hưởng đến hiệu suất.

- **Đơn vị viewport mặc định**
  - : Kích thước viewport mặc định được xác định bởi trình duyệt. Hành vi của đơn vị theo phần trăm viewport kết quả có thể tương đương với đơn vị theo phần trăm viewport dựa trên kích thước viewport nhỏ, kích thước viewport lớn, kích thước trung gian giữa hai kích thước, hoặc kích thước viewport động.

    > [!NOTE]
    > Ví dụ, một trình duyệt có thể triển khai đơn vị theo phần trăm viewport mặc định cho chiều cao (`vh`) tương đương với đơn vị theo phần trăm chiều cao viewport lớn (`lvh`). Nếu vậy, điều này có thể che khuất nội dung trên màn hình toàn trang khi giao diện trình duyệt được mở rộng. Hiện tại, tất cả các đơn vị viewport mặc định (`vh`, `vw`, v.v.) tương đương với các đối tác viewport lớn của chúng (`lvh`, `lvw`, v.v.).

Các độ dài theo phần trăm viewport định nghĩa giá trị `<length>` theo tỷ lệ phần trăm so với kích thước của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) ban đầu, lần lượt dựa trên kích thước của {{Glossary("viewport")}} hoặc khu vực trang, tức là phần hiển thị của tài liệu. Khi chiều cao hoặc chiều rộng của khối chứa ban đầu thay đổi, các phần tử được đặt kích thước dựa trên chúng sẽ được thu phóng tương ứng. Có một biến thể đơn vị độ dài theo phần trăm viewport tương ứng với mỗi kích thước viewport, như được mô tả bên dưới.

> [!NOTE]
> Độ dài viewport không hợp lệ trong các khối khai báo {{cssxref("@page")}}.

- `vh`
  - : Biểu diễn tỷ lệ phần trăm chiều cao của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) ban đầu của viewport. `1vh` là 1% chiều cao viewport. Ví dụ, nếu chiều cao viewport là `300px`, thì giá trị `70vh` trên một thuộc tính sẽ là `210px`.

    Các đơn vị theo phần trăm viewport tương ứng cho kích thước viewport nhỏ, lớn và động là `svh`, `lvh` và `dvh`. `vh` tương đương với `lvh`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

- `vw`
  - : Biểu diễn tỷ lệ phần trăm chiều rộng của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) ban đầu của viewport. `1vw` là 1% chiều rộng viewport. Ví dụ, nếu chiều rộng viewport là `800px`, thì giá trị `50vw` trên một thuộc tính sẽ là `400px`.

    Đối với kích thước viewport nhỏ, lớn và động, các đơn vị theo phần trăm viewport tương ứng là `svw`, `lvw` và `dvw`.
    `vw` tương đương với `lvw`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

- `vmax`
  - : Biểu diễn theo phần trăm giá trị lớn nhất trong `vw` và `vh`.

    Đối với kích thước viewport nhỏ, lớn và động, các đơn vị theo phần trăm viewport tương ứng là `svmax`, `lvmax` và `dvmax`.
    `vmax` tương đương với `lvmax`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

- `vmin`
  - : Biểu diễn theo phần trăm giá trị nhỏ nhất trong `vw` và `vh`.

    Đối với kích thước viewport nhỏ, lớn và động, các đơn vị theo phần trăm viewport tương ứng là `svmin`, `lvmin` và `dvmin`.
    `vmin` tương đương với `lvmin`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

- `vb`
  - : Biểu diễn tỷ lệ phần trăm kích thước của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) ban đầu, theo hướng [trục khối](/vi/docs/Web/CSS/Guides/Logical_properties_and_values) của phần tử gốc.

    Đối với kích thước viewport nhỏ, lớn và động, các đơn vị theo phần trăm viewport tương ứng là `svb`, `lvb` và `dvb`.
    `vb` tương đương với `lvb`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

- `vi`
  - : Biểu diễn tỷ lệ phần trăm kích thước của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) ban đầu, theo hướng [trục nội tuyến](/vi/docs/Web/CSS/Guides/Logical_properties_and_values) của phần tử gốc.

    Đối với kích thước viewport nhỏ, lớn và động, các đơn vị theo phần trăm viewport tương ứng là `svi`, `lvi` và `dvi`.
    `vi` tương đương với `lvi`, biểu diễn đơn vị độ dài theo phần trăm viewport dựa trên kích thước viewport lớn.

### Đơn vị độ dài truy vấn container

Khi áp dụng kiểu cho container bằng truy vấn container, bạn có thể dùng các đơn vị độ dài truy vấn container.
Các đơn vị này chỉ định một độ dài tương đối với kích thước của container truy vấn.
Các thành phần sử dụng các đơn vị độ dài tương đối với container của chúng linh hoạt hơn để dùng trong các container khác nhau mà không cần tính lại các giá trị độ dài cụ thể.

Nếu không có container đủ điều kiện cho truy vấn, đơn vị độ dài truy vấn container mặc định là [đơn vị viewport nhỏ](#đơn_vị_viewport_nhỏ) cho trục đó (`sv*`).

Để biết thêm thông tin, xem [Truy vấn container](/vi/docs/Web/CSS/Guides/Containment/Container_queries).

- `cqw`
  - : Biểu diễn tỷ lệ phần trăm chiều rộng của container truy vấn. `1cqw` là 1% chiều rộng của container truy vấn. Ví dụ, nếu chiều rộng của container truy vấn là `800px`, thì giá trị `50cqw` trên một thuộc tính sẽ là `400px`.

- `cqh`
  - : Biểu diễn tỷ lệ phần trăm chiều cao của container truy vấn. `1cqh` là 1% chiều cao của container truy vấn. Ví dụ, nếu chiều cao của container truy vấn là `300px`, thì giá trị `10cqh` trên một thuộc tính sẽ là `30px`.

- `cqi`
  - : Biểu diễn tỷ lệ phần trăm kích thước nội tuyến của container truy vấn. `1cqi` là 1% kích thước nội tuyến của container truy vấn. Ví dụ, nếu kích thước nội tuyến của container truy vấn là `800px`, thì giá trị `50cqi` trên một thuộc tính sẽ là `400px`.

- `cqb`
  - : Biểu diễn tỷ lệ phần trăm kích thước khối của container truy vấn. `1cqb` là 1% kích thước khối của container truy vấn. Ví dụ, nếu kích thước khối của container truy vấn là `300px`, thì giá trị `10cqb` trên một thuộc tính sẽ là `30px`.

- `cqmin`
  - : Biểu diễn tỷ lệ phần trăm giá trị nhỏ hơn giữa kích thước nội tuyến hoặc kích thước khối của container truy vấn. `1cqmin` là 1% giá trị nhỏ hơn giữa kích thước nội tuyến hoặc kích thước khối của container truy vấn. Ví dụ, nếu kích thước nội tuyến của container truy vấn là `800px` và kích thước khối của nó là `300px`, thì giá trị `50cqmin` trên một thuộc tính sẽ là `150px`.

- `cqmax`
  - : Biểu diễn tỷ lệ phần trăm giá trị lớn hơn giữa kích thước nội tuyến hoặc kích thước khối của container truy vấn. `1cqmax` là 1% giá trị lớn hơn giữa kích thước nội tuyến hoặc kích thước khối của container truy vấn. Ví dụ, nếu kích thước nội tuyến của container truy vấn là `800px` và kích thước khối của nó là `300px`, thì giá trị `50cqmax` trên một thuộc tính sẽ là `400px`.

## Đơn vị độ dài tuyệt đối

**Đơn vị độ dài tuyệt đối** biểu diễn một phép đo vật lý khi các thuộc tính vật lý của phương tiện đầu ra được biết, chẳng hạn đối với bố cục in. Điều này được thực hiện bằng cách neo một trong các đơn vị với một **đơn vị vật lý** hoặc **đơn vị góc nhìn** và sau đó định nghĩa các đơn vị khác tương đối với nó. Các đơn vị vật lý bao gồm `cm`, `in`, `mm`, `pc`, `pt`, `px` và `Q`. Việc neo được thực hiện khác nhau đối với các thiết bị độ phân giải thấp, chẳng hạn như màn hình, so với các thiết bị độ phân giải cao, chẳng hạn như máy in.

Đối với các thiết bị dpi thấp, đơn vị `px` biểu diễn _pixel tham chiếu_ vật lý; các đơn vị khác được định nghĩa tương đối với nó. Do đó, `1in` được định nghĩa là `96px`, bằng `72pt`. Hệ quả của định nghĩa này là trên các thiết bị như vậy, các kích thước được mô tả bằng inch (`in`), centimeter (`cm`) hoặc milimeter (`mm`) không nhất thiết phải khớp với kích thước của đơn vị vật lý cùng tên.

Đối với các thiết bị dpi cao, inch (`in`), centimeter (`cm`) và milimeter (`mm`) giống với các đối tác vật lý của chúng. Do đó, đơn vị `px` được định nghĩa tương đối với chúng (1/96 của `1in`).

> [!NOTE]
> Nhiều người dùng tăng kích thước phông chữ mặc định của {{Glossary("user agent")}} của họ để làm cho văn bản dễ đọc hơn. Độ dài tuyệt đối có thể gây ra vấn đề về khả năng truy cập vì chúng cố định và không thu phóng theo cài đặt của người dùng. Vì lý do này, hãy ưu tiên độ dài tương đối (như `em` hoặc `rem`) khi đặt `font-size`.

- `px`
  - : Một pixel. Đối với màn hình hiển thị, nó theo truyền thống biểu diễn một {{glossary("device pixel")}} (điểm). Tuy nhiên, đối với _máy in_ và _màn hình độ phân giải cao_, một pixel CSS ngụ ý nhiều pixel thiết bị. `1px` = `1in / 96`.
- `cm`
  - : Một centimeter. `1cm` = `96px / 2.54`.
- `mm`
  - : Một milimeter. `1mm` = `1cm / 10`.
- `Q`
  - : Một phần tư milimeter. `1Q` = `1cm / 40`.
- `in`
  - : Một inch. `1in` = `2.54cm` = `96px`.
- `pc`
  - : Một pica. `1pc` = `12pt` = `1in / 6`.
- `pt`
  - : Một điểm. `1pt` = `1in / 72`.

## Nội suy

Khi tạo hoạt ảnh, các giá trị của kiểu dữ liệu `<length>` được nội suy dưới dạng số thực dấu phẩy động. {{glossary("interpolation", "Nội suy")}} xảy ra trên giá trị được tính toán. Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên kết với hoạt ảnh.

## Ví dụ

### So sánh các đơn vị độ dài khác nhau

Ví dụ sau đây cung cấp cho bạn một trường nhập liệu để nhập giá trị `<length>` (ví dụ: `300px`, `50%`, `30vw`) để đặt chiều rộng của thanh kết quả sẽ xuất hiện bên dưới sau khi bạn nhấn phím <kbd>Enter</kbd> hoặc <kbd>Return</kbd>.

Điều này cho phép bạn so sánh và đối chiếu hiệu ứng của các đơn vị độ dài khác nhau.

#### HTML

```html
<div class="outer">
  <div class="input-container">
    <label for="length">Enter width:</label>
    <input type="text" id="length" />
  </div>
  <div class="inner"></div>
</div>
<div class="results"></div>
```

#### CSS

```css
html {
  font-family: sans-serif;
  font-weight: bold;
  box-sizing: border-box;
}

.outer {
  width: 100%;
  height: 50px;
  background-color: #eeeeee;
  position: relative;
}

.inner {
  height: 50px;
  background-color: #999999;
  box-shadow:
    inset 3px 3px 5px rgb(255 255 255 / 50%),
    inset -3px -3px 5px rgb(0 0 0 / 50%);
}

.result {
  height: 20px;
  box-shadow:
    inset 3px 3px 5px rgb(255 255 255 / 50%),
    inset -3px -3px 5px rgb(0 0 0 / 50%);
  background-color: orange;
  display: flex;
  align-items: center;
  margin-top: 10px;
}

.result code {
  position: absolute;
  margin-left: 20px;
}

.results {
  margin-top: 10px;
}

.input-container {
  position: absolute;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  height: 50px;
}

label {
  margin: 0 10px 0 20px;
}
```

#### JavaScript

```js
const inputDiv = document.querySelector(".inner");
const inputElem = document.querySelector("input");
const resultsDiv = document.querySelector(".results");

inputElem.addEventListener("change", () => {
  inputDiv.style.width = inputElem.value;

  const result = document.createElement("div");
  result.className = "result";
  result.style.width = inputElem.value;
  const code = document.createElement("code");
  code.textContent = `width: ${inputElem.value}`;
  result.appendChild(code);
  resultsDiv.appendChild(result);

  inputElem.value = "";
  inputElem.focus();
});
```

#### Kết quả

{{EmbedLiveSample('Comparing different length units', '100%', 700)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
- [Mô-đun giá trị & đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Mô hình hộp](/vi/docs/Web/CSS/Guides/Box_model)
