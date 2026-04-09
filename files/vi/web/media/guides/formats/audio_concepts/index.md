---
title: Khái niệm âm thanh số
slug: Web/Media/Guides/Formats/Audio_concepts
page-type: guide
sidebar: mediasidebar
---

Biểu diễn âm thanh ở dạng số gồm nhiều bước và quy trình, với nhiều định dạng khác nhau cho cả âm thanh thô lẫn âm thanh đã mã hóa hoặc nén - chính loại âm thanh thực sự được dùng trên web. Hướng dẫn này là phần tổng quan về cách âm thanh được biểu diễn dưới dạng số, và cách codec được dùng để mã hóa và giải mã âm thanh cho web.

## Lấy mẫu âm thanh

Âm thanh vốn là một đặc tính tương tự của thế giới tự nhiên. Khi một vật thể rung, nó cũng làm các phân tử xung quanh rung theo. Những phân tử này lại tác động lên các phân tử bên cạnh, rồi cứ thế lan truyền dao động dưới dạng một sóng ra xa nguồn cho đến khi biên độ của sóng (độ lớn âm thanh) giảm dần theo khoảng cách. Vì thế, mức độ mịn của một sóng âm trong thế giới thực tương ứng với một phân tử đơn lẻ của môi trường mà sóng âm đang truyền qua.

Trên Trái Đất, môi trường mà phần lớn âm thanh truyền qua là không khí. Một số âm thanh truyền qua nước, hoặc thậm chí qua lớp đá cấu thành hành tinh này (nếu bạn từng nghe tiếng rền hoặc nổ của động đất, bạn đã trải nghiệm hiện tượng này), nhưng gần như mọi âm thanh bạn nghe mỗi ngày đều đến tai bạn qua không khí.

Vì vậy, những âm thanh mà con người nghe mỗi ngày thực ra là các dao động trong không khí gây tác động đến cấu trúc bên trong của tai. Phân tử không khí di chuyển càng xa theo mỗi xung của sóng thì biên độ sóng càng lớn, và âm thanh càng to. Phân tử rung càng nhanh thì tần số sóng càng cao.

Biên độ (chiều cao) của sóng càng lớn thì tại thời điểm đó âm thanh càng to. Bước sóng càng ngắn (đỉnh sóng càng gần nhau) thì tần số (hay cao độ) của âm thanh tạo ra càng cao.

![Dạng sóng âm thanh](audio-waveform.svg)

Tuy nhiên, máy tính là hệ thống số. Để biểu diễn một sóng âm theo cách mà máy tính có thể thao tác và xử lý được (chưa nói đến việc truyền qua mạng), âm thanh phải được chuyển sang dạng số. Quá trình này gọi là **chuyển đổi tương tự sang số** (hay **A/D**).

Yếu tố đầu tiên ảnh hưởng đến độ trung thực của âm thanh được thu là **băng thông âm thanh**; tức là dải tần âm thanh mà bộ chuyển đổi A/D có thể thu và chuyển thành dạng số. Băng thông âm thanh cũng bị ảnh hưởng bởi codec, nếu nó chọn loại bỏ một số dải tần khi mã hóa âm thanh.

Âm thanh đi vào máy tính qua micro hoặc đầu vào khác dưới dạng một luồng electron có điện áp thay đổi để biểu diễn biên độ của sóng âm. Tín hiệu tương tự này sau đó được chuyển thành dạng số bằng một mạch lấy mẫu biên độ của sóng đến tại các khoảng thời gian đều đặn, rồi chuyển dữ liệu đó thành một con số theo định dạng mà hệ thống ghi âm có thể hiểu được. Mỗi khoảnh khắc được lấy mẫu này là một **mẫu**. Khi nối tất cả các mẫu lại với nhau, ta có thể xấp xỉ sóng ban đầu, như trong sơ đồ bên dưới.

![Dạng sóng âm thanh với các mẫu được lấy theo chu kỳ](audio-waveform-samples1.svg)

Trong ví dụ này, đường màu xanh biểu diễn các mẫu lấy từ dạng sóng âm thanh màu đen. Theo các khoảng thời gian đều đặn, mạch chuyển đổi A/D đọc điện áp của tín hiệu thành một giá trị nằm giữa (trong trường hợp này) -1.0 và +1.0. Vì biên độ thay đổi trong suốt khoảng thời gian đó, bộ chuyển đổi A/D phải chọn một giá trị đại diện cho khoảng đó, hoặc lấy giá trị tại một thời điểm cụ thể (trong sơ đồ trên, điểm giữa của mỗi lát được dùng làm giá trị), hoặc lấy trung bình biên độ trong suốt thời gian của từng mẫu. Các giá trị mẫu này sau đó được ghi lại như biên độ của dạng sóng tại thời điểm đó.

Khi đến lúc phát lại âm thanh đó sau này, các biên độ này được dùng để tạo ra một xấp xỉ của dạng sóng gốc; thay vì phát lại một bản sao chính xác, mượt mà của sóng gốc, hệ thống sẽ phát sóng màu xanh thô hơn.

Càng lấy mẫu âm thanh gốc thường xuyên, bạn càng có thể tiến gần hơn đến bản gốc. Số mẫu được lấy mỗi giây được gọi là **tốc độ lấy mẫu**. Hãy xem sóng ở trên, và thử hình dung sóng số màu xanh sẽ khác đi thế nào nếu bạn lấy mẫu thường xuyên gấp đôi. Hoặc gấp mười lần. Càng lấy nhiều mẫu, sóng càng mượt.

## Định dạng và cấu trúc dữ liệu âm thanh

Ở mức cơ bản nhất, âm thanh được biểu diễn bằng một luồng mẫu, trong đó mỗi mẫu chỉ định biên độ của dạng sóng âm được đo cho một lát xác định của toàn bộ dạng sóng tín hiệu âm thanh. Có nhiều định dạng được dùng cho các mẫu riêng lẻ trong một tệp âm thanh. Phần lớn tệp âm thanh dùng số nguyên có dấu 16-bit cho mỗi mẫu, nhưng một số khác dùng giá trị số thực dấu phẩy động 32-bit hoặc số nguyên 24-bit hay 32-bit. Một số định dạng tệp âm thanh cũ hơn - mà bạn sẽ không thấy trên web - dùng mẫu số nguyên 8-bit. Ngoài ra, mẫu cũng có thể dùng giá trị có dấu hoặc không dấu. Kích thước của một mẫu riêng lẻ được gọi là **kích thước mẫu**.

Vị trí của mỗi nguồn âm trong tín hiệu âm thanh được gọi là một **kênh**. Mỗi kênh chứa một mẫu biểu thị biên độ của âm thanh được tạo ra bởi nguồn đó tại một thời điểm cụ thể. Ví dụ, trong âm thanh stereo, có hai nguồn âm: một loa bên trái và một loa bên phải. Mỗi nguồn được biểu diễn bằng một kênh, và số kênh chứa trong tín hiệu âm thanh được gọi là **số lượng kênh**.

Khi ghi âm hoặc tạo các tệp âm thanh nhiều kênh, các kênh được ghép thành một chuỗi **khung âm thanh**, mỗi khung gồm một mẫu cho từng kênh trong âm thanh. Một mẫu riêng lẻ là một giá trị số biểu diễn biên độ của [dạng sóng](https://en.wikipedia.org/wiki/Waveform) tại một thời điểm duy nhất, và có thể được biểu diễn bằng nhiều định dạng khác nhau.

Âm thanh stereo có lẽ là cách bố trí kênh được dùng phổ biến nhất trong âm thanh web, và mẫu 16-bit được dùng cho phần lớn âm thanh hằng ngày hiện nay. Với âm thanh stereo 16-bit, mỗi mẫu lấy từ tín hiệu tương tự được ghi lại thành hai số nguyên 16-bit, một cho kênh trái và một cho kênh phải. Điều đó có nghĩa là mỗi mẫu cần 32 bit bộ nhớ. Với tốc độ lấy mẫu phổ biến là 48 kHz (48.000 mẫu mỗi giây), điều này có nghĩa là mỗi giây âm thanh chiếm 192 kB bộ nhớ. Vì vậy, một bài hát ba phút điển hình cần khoảng 34,5 MB bộ nhớ. Đó là rất nhiều dung lượng lưu trữ, nhưng còn tệ hơn là nó tiêu tốn lượng băng thông mạng khổng lồ cho một đoạn âm thanh tương đối ngắn. Đó là lý do phần lớn âm thanh số được nén.

Quá trình nén và giải nén âm thanh được thực hiện bằng cách mã hóa và giải mã nó bằng một **{{Glossary("codec")}}** âm thanh (**CO**der/**DE**coder). Qua nhiều năm, rất nhiều codec đã được phát triển, trong đó một số được dùng phổ biến trên web. Để biết chi tiết về những codec quan trọng và hữu ích nhất mà nhà phát triển web nên nắm, xem bài viết [Hướng dẫn codec âm thanh được dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs).

### Kênh âm thanh và khung

Có hai loại kênh âm thanh. Kênh âm thanh tiêu chuẩn dùng để trình bày phần lớn âm thanh nghe được. Âm thanh cho các kênh chính trái và phải, cũng như toàn bộ loa âm thanh vòm của bạn (kênh trung tâm, loa sau trái/phải, loa bên trái/phải, kênh trên trần, v.v.) đều là kênh âm thanh tiêu chuẩn. Các kênh **tăng cường tần số thấp** (**LFE**) đặc biệt cung cấp tín hiệu cho những loa chuyên tạo ra âm thanh tần số thấp và rung động để mang lại cảm giác mạnh khi nghe âm thanh. Kênh LFE thường điều khiển loa siêu trầm và các thiết bị tương tự.

Âm đơn (monophonic) có một kênh, âm stereo có hai kênh, âm thanh vòm 5.1 có 6 kênh (năm kênh tiêu chuẩn và một kênh LFE), v.v. Mỗi khung âm thanh là một bản ghi dữ liệu chứa các mẫu cho toàn bộ kênh có trong tín hiệu âm thanh. Kích thước của một khung âm thanh được tính bằng cách nhân kích thước mẫu tính theo byte với số lượng kênh, nên một khung đơn của âm thanh stereo 16-bit dài 4 byte và một khung đơn của âm thanh 5.1 dấu phẩy động dài 24 byte (4 byte cho mỗi mẫu nhân với 6 kênh).

> [!NOTE]
> Một số codec thực tế sẽ tách riêng kênh trái và phải, lưu chúng trong các khối riêng biệt trong cấu trúc dữ liệu của chúng. Tuy nhiên, một khung âm thanh luôn bao gồm toàn bộ dữ liệu của tất cả các kênh hiện có.

Số khung tạo nên một giây âm thanh thay đổi tùy theo tốc độ lấy mẫu được dùng khi ghi âm. Vì tốc độ lấy mẫu tương ứng với số "lát" mà một sóng âm được chia thành trong mỗi giây, nó đôi khi được xem như một tần số (theo nghĩa là nó mô tả một thứ lặp lại theo chu kỳ, không phải theo tần số âm thanh thực), và phép đo số mẫu mỗi giây do đó dùng đơn vị [Hertz](https://en.wikipedia.org/wiki/Hertz).

Các tốc độ lấy mẫu phổ biến nhất là:

- 8000 Hz
  - : Tiêu chuẩn quốc tế [G.711](https://en.wikipedia.org/wiki/G.711) cho âm thanh dùng trong điện thoại sử dụng tốc độ lấy mẫu 8000 Hz (8 kHz). Điều này đủ để lời nói của con người có thể hiểu được.
- 44100 Hz
  - : Tốc độ lấy mẫu 44,1 kHz được dùng cho âm thanh CD. CD cung cấp âm thanh stereo 16-bit không nén ở 44,1 kHz. Âm thanh máy tính cũng thường mặc định dùng tần số này.
- 48000 Hz
  - : Âm thanh trên DVD được ghi ở 48 kHz. Tần số này cũng thường được dùng cho âm thanh máy tính.
- 96000 Hz
  - : Âm thanh độ phân giải cao.
- 192000 Hz
  - : Âm thanh siêu độ phân giải cao. Chưa được dùng phổ biến, nhưng điều đó sẽ thay đổi theo thời gian.

Có một lý do khiến 44,1 kHz được xem là tốc độ lấy mẫu "độ trung thực cao" tối thiểu. Định lý lấy mẫu [Nyquist-Shannon](https://en.wikipedia.org/wiki/Nyquist-Shannon_sampling_theorem) quy định rằng để tái tạo âm thanh chính xác, nó phải được lấy mẫu ở tốc độ gấp đôi tần số của âm thanh. Vì dải nghe của con người vào khoảng từ 20 Hz đến 20.000 Hz, việc tái tạo các âm có cao độ cao nhất mà con người thường có thể nghe đòi hỏi tốc độ lấy mẫu lớn hơn 40.000 Hz.

Để chừa thêm khoảng trống cho [bộ lọc thông thấp](https://en.wikipedia.org/wiki/Low-pass_filter) nhằm tránh méo tiếng do [aliasing](https://en.wikipedia.org/wiki/Aliasing), một [dải chuyển tiếp](https://en.wikipedia.org/wiki/Transition_band) bổ sung 2,05 kHz được thêm vào tần số trước khi lấy mẫu (kết quả là 22.050 Hz). Nhân đôi theo định lý Nyquist sẽ cho tần số tối thiểu cuối cùng là (bạn đoán đúng rồi) 44,1 kHz.

Âm thanh độ phân giải cao (96 kHz) được dùng trong một số hệ thống âm thanh cao cấp, và âm thanh siêu độ phân giải cao (192 kHz) hữu ích cho khâu master âm thanh, nơi bạn cần chất lượng cao nhất có thể khi thao tác và chỉnh sửa âm thanh trước khi giảm mẫu xuống tốc độ bạn sẽ dùng cho sản phẩm cuối cùng. Điều này tương tự như việc các nhiếp ảnh gia dùng ảnh độ phân giải cao để chỉnh sửa và ghép ảnh trước khi xuất ra JPEG phù hợp để dùng trên website.

### Kích thước tệp âm thanh và băng thông mạng

Khi đã biết kích thước của một khung âm thanh và số khung trên mỗi giây tạo nên dữ liệu âm thanh của bạn, bạn có thể dễ dàng tính được dữ liệu âm thanh thô sẽ chiếm bao nhiêu dung lượng (và vì thế tiêu tốn bao nhiêu băng thông trên mạng).

Ví dụ, hãy xem một đoạn âm thanh stereo (tức là hai kênh âm thanh) với kích thước mẫu 16 bit (2 byte), được ghi ở 48 kHz:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mn>2</mn><mo>×</mo><mn>2</mn><mfrac><mrow><mi>bytes</mi></mrow><mrow><mi>sample</mi></mrow></mfrac><mo>×</mo><mn>48000</mn><mfrac><mrow><mi>samples</mi></mrow><mrow><mi>second</mi></mrow></mfrac><mo>=</mo><mn>192000</mn><mfrac><mrow><mi>bytes</mi></mrow><mrow><mi>second</mi></mrow></mfrac><mo>=</mo><mn>192</mn><mi>kBps</mi></mrow><annotation encoding="TeX">2 \times 2\frac { bytes }{ sample } \times 48000\frac { samples }{ second } = 192000\frac { bytes }{ second } = 192 kBps</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Ở mức 192 kBps, ngay cả các mạng tầm thấp cũng sẽ bắt đầu bị căng chỉ vì một luồng âm thanh duy nhất đang phát. Nếu mạng đồng thời còn phải làm việc khác, vấn đề này sẽ xuất hiện ngay cả trên các mạng có băng thông cao hơn. Với mức cạnh tranh băng thông cao như vậy, đặc biệt trên các mạng chậm, lượng dữ liệu này có thể là quá nhiều để truyền khả thi trong bất kỳ ứng dụng thời gian thực nào.

Để giải quyết vấn đề này, âm thanh phải được làm nhỏ hơn bằng cách nén.

> [!NOTE]
> Băng thông mạng rõ ràng không phải là băng thông âm thanh, thứ được thảo luận trong [Lấy mẫu âm thanh](#sampling_audio), ở trên.

## Cơ bản về nén âm thanh

Không giống văn bản và nhiều loại dữ liệu khác, dữ liệu âm thanh thường mang tính **nhiễu**, nghĩa là dữ liệu hiếm khi gồm một chuỗi byte hoặc chuỗi byte lặp lại chính xác. Kết quả là, dữ liệu âm thanh khó nén bằng các thuật toán truyền thống như những thuật toán được dùng bởi các công cụ đa dụng như `zip`, vốn thường hoạt động bằng cách thay thế các chuỗi lặp lại bằng một biểu diễn rút gọn.

Có một số kỹ thuật có thể áp dụng khi nén âm thanh. Phần lớn codec dùng kết hợp các kỹ thuật này, và có thể dùng thêm các kỹ thuật khác nữa.

Điều đơn giản nhất bạn có thể làm là áp dụng một bộ lọc loại bỏ tiếng xì và các âm rất nhỏ, chuyển mọi đoạn yên lặng thành im lặng và làm mượt tín hiệu. Việc này có thể tạo ra các đoạn im lặng cũng như các tín hiệu lặp lại hoặc gần lặp lại khác, từ đó có thể rút gọn.

Bạn có thể áp dụng một bộ lọc làm hẹp băng thông âm thanh, loại bỏ mọi tần số âm thanh mà bạn không quan tâm. Điều này đặc biệt hữu ích cho tín hiệu chỉ có giọng nói. Làm vậy sẽ loại bỏ dữ liệu, khiến tín hiệu đầu ra dễ nén hơn.

### Âm học tâm lý

Nếu bạn biết mình thường phải xử lý loại âm thanh nào, bạn có thể tìm ra các kỹ thuật lọc đặc biệt áp dụng riêng cho loại âm thanh đó để tối ưu hóa quá trình mã hóa.

Những phương pháp nén âm thanh được dùng phổ biến nhất áp dụng khoa học **[âm học tâm lý](https://en.wikipedia.org/wiki/Psychoacoustics)**. Đây là ngành khoa học nghiên cứu cách con người cảm nhận âm thanh, và những phần nào của các dải tần âm thanh chúng ta nghe là quan trọng nhất đối với phản ứng của ta trước âm thanh đó, tùy theo ngữ cảnh và nội dung âm thanh. Các yếu tố như khả năng cảm nhận sự thay đổi tần số của âm thanh, dải nghe của con người so với tần số của tín hiệu âm thanh, khả năng định vị âm thanh, v.v. đều có thể được codec cân nhắc.

Bằng cách hiểu biết chắc chắn về âm học tâm lý, người ta có thể thiết kế một phương pháp nén giúp giảm tối đa kích thước đã nén của âm thanh trong khi tối đa hóa cảm nhận về độ trung thực. Một thuật toán dùng âm học tâm lý có thể dùng bất kỳ kỹ thuật nào đã nêu ở đây, và gần như chắc chắn cũng sẽ áp dụng thêm các kỹ thuật khác.

Tất cả những điều này có nghĩa là có một câu hỏi nền tảng phải được đặt ra và trả lời trước khi chọn codec: xét theo nội dung âm thanh, ngữ cảnh sử dụng và đối tượng mục tiêu, việc mất đi một mức nào đó của độ trung thực âm thanh có chấp nhận được hay không, và nếu có thì chấp nhận bao nhiêu; hay kết quả sau khi giải mã dữ liệu phải giống hệt âm thanh nguồn?

### Nén mất dữ liệu so với nén không mất dữ liệu

Nếu việc mất chi tiết và có thể cả độ trung thực là không thể chấp nhận hoặc không mong muốn, codec **không mất dữ liệu** sẽ là lựa chọn ưu tiên. Mặt khác, nếu có thể chấp nhận giảm bớt một phần độ trung thực của âm thanh, có thể dùng codec **mất dữ liệu**. Nhìn chung, nén mất dữ liệu cho kết quả đầu ra nhỏ hơn đáng kể so với nén không mất dữ liệu; hơn nữa, nhiều codec mất dữ liệu rất tốt, khiến người nghe trung bình khó hoặc thậm chí không thể nhận ra sự suy giảm về chất lượng và chi tiết.

> [!NOTE]
> Mặc dù tác động của một thuật toán nén mất dữ liệu chất lượng cao lên chất lượng âm thanh có thể khó nhận thấy, việc sử dụng nó vẫn có thể làm giảm độ phức tạp của luồng sóng âm theo cách sẽ được chú ý nếu người dùng so sánh trực tiếp với âm thanh gốc. Điều này đặc biệt đúng với âm nhạc và các nguồn âm thanh đa dạng, phức tạp khác.

Đa số codec âm thanh sử dụng một số dạng nén mất dữ liệu, vì tỷ lệ nén mà các thuật toán đó mang lại tốt hơn. Trong khi các thuật toán nén không mất dữ liệu thường chỉ đạt mức không tốt hơn 40-50% so với kích thước dữ liệu âm thanh gốc chưa nén, các thuật toán nén mất dữ liệu hiện đại có thể giảm kích thước âm thanh xuống còn 5-20% kích thước gốc, tùy vào độ phức tạp của âm thanh. Tỷ lệ nén vượt trội mà nén mất dữ liệu mang lại thường khiến nó trở thành lựa chọn hấp dẫn, và chất lượng âm thanh đủ tốt hoặc rất tốt là hoàn toàn khả thi với các cấu hình codec được chọn đúng.

Các nhà nghiên cứu vẫn đang tiếp tục tạo ra những cách tốt hơn để phân tích và nén âm thanh, nên thỉnh thoảng lại xuất hiện các định dạng mới mang đến nhiều cải tiến khác nhau, hoặc ở tỷ lệ nén, hoặc ở độ trung thực âm thanh (hoặc cả hai).

Các trường hợp nên dùng âm thanh không mất dữ liệu gồm:

- Bất kỳ tình huống nào mà người nghe mong đợi âm thanh được tái tạo chính xác và có khả năng nghe đủ tốt để phân biệt các chi tiết tinh vi của âm thanh chưa bị biến đổi
- Các vòng lặp âm thanh và mẫu âm thanh dùng trong công việc sản xuất nhạc và hiệu ứng âm thanh
- Các tình huống mà các đoạn hoặc mẫu âm thanh có thể được phối lại rồi nén tiếp; dùng âm thanh không mất dữ liệu trong giai đoạn master sẽ tránh việc nén lại dữ liệu vốn đã nén, từ đó giảm thêm chất lượng

Các yếu tố có thể khiến bạn nên dùng nén mất dữ liệu gồm:

- Dữ liệu âm thanh nguồn rất lớn
- Lưu trữ bị giới hạn (do dung lượng lưu trữ nhỏ, hoặc vì có quá nhiều âm thanh cần lưu)
- Cần giới hạn băng thông mạng để phát sóng âm thanh; điều này đặc biệt quan trọng với luồng trực tiếp và teleconferencing

## Nhập môn âm học tâm lý

Đi sâu vào chi tiết âm học tâm lý và cách nén âm thanh hoạt động vượt xa phạm vi của bài viết này, nhưng có một ý tưởng tổng quát về cách các thuật toán phổ biến nén âm thanh sẽ giúp hiểu và đưa ra quyết định tốt hơn khi chọn codec âm thanh.

Các thuật toán nén mất dữ liệu thường dùng âm học tâm lý để xác định thành phần nào của dạng sóng âm có thể bị mất hoặc làm suy yếu theo một cách giúp cải thiện tỷ lệ nén trong khi giảm tối đa tác động nghe được đối với người nghe mục tiêu. Bằng cách thao tác dạng sóng để nó dễ nén hơn, hoặc bằng cách loại bỏ các thành phần âm thanh thực ra không được nghe rõ, dạng sóng trở nên đơn giản hơn, tạo ra dữ liệu có tính nhất quán cao hơn và do đó dễ nén hơn. Giới hạn băng thông âm thanh chỉ để bao gồm những tần số quan trọng nhất đối với cách tai người diễn giải âm thanh đã giải mã cũng có thể cải thiện khả năng nén.

Loại nội dung được mã hóa có thể ảnh hưởng đến việc chọn codec. Cụ thể, dạng sóng của âm nhạc hầu như luôn phức tạp hơn một mẫu âm thanh chỉ chứa giọng người. Ngoài ra, giọng người chỉ chiếm một phần nhỏ trong dải tần mà tai người có thể phát hiện.

> [!NOTE]
> Mạng điện thoại, vốn ban đầu được thiết kế riêng để truyền giọng nói con người, chỉ có thể mang âm thanh (hoặc bất kỳ loại tín hiệu nào khác) trong dải tần từ 300 Hz đến 3.000 Hz. Điều này không bao phủ hoàn toàn dải thấp nhất của lời nói con người, nhưng vẫn còn đủ dạng sóng để tai và não người dễ dàng bù trừ. Điều này cũng có nghĩa là con người thường đã quen với việc nghe giọng nói bị giới hạn trong một băng thông âm thanh hẹp như vậy.

Lời nói của con người sử dụng một dải tần tương đối hẹp (khoảng 300 Hz đến 18.000 Hz, dù phạm vi chính xác thay đổi theo từng người do các yếu tố như giới tính). Ngoài ra, phần lớn âm thanh lời nói của con người thường nằm trong khoảng 500 Hz đến 3.000 Hz, vì vậy có thể loại bỏ một phần đáng kể của toàn bộ dạng sóng mà không làm giảm khả năng người nghe hiểu các từ được nói. Bạn thậm chí có thể điều chỉnh băng thông âm thanh để tính đến cao độ giọng của từng người nói.

Vì tất cả những yếu tố này, và vì dạng sóng lời nói thường ít phức tạp hơn âm nhạc, việc tái tạo lời nói với độ trung thực cao (và cụ thể hơn là "đủ cao") có thể đạt được ở bitrate tương đối thấp.

Khi một thuật toán nén được thiết kế để nén âm thanh tổng quát phân tích một dạng sóng âm, nó có thể loại bỏ mọi thứ nằm ngoài dải nghe của con người (hoặc thậm chí nhiều hơn, tùy mức độ chấp nhận rủi ro mất chi tiết ở đầu cao và/hoặc đầu thấp của dải tần). Điều đó có nghĩa là codec có thể loại bỏ âm thanh có tần số thấp hơn khoảng 20 Hz hoặc cao hơn khoảng 20.000 Hz (20 kHz). Điều này thu hẹp băng thông âm thanh của âm thanh, từ đó giảm lượng dữ liệu cần thiết để biểu diễn tín hiệu ở dạng đã nén. Băng thông âm thanh không thể bị giảm nhiều như đối với codec chỉ dành cho lời nói, nhưng đây vẫn là một khởi đầu hữu ích.

Một số người có thể nghe vượt ra ngoài phạm vi này ở một mức độ nào đó. Thường thì khả năng nghe các tần số cao của họ còn thấp hơn mức này; đặc biệt, đáng chú ý là đến tuổi trung niên, đầu cao của dải tần đó thường giảm từ 20 kHz xuống khoảng 12 kHz đến 14 kHz. Điều này cho thấy các tần số cao hơn thường có thể bị loại bỏ mà không ảnh hưởng quá mức đến khả năng hiểu của âm thanh, vì vậy bạn có thể giảm đáng kể lượng không gian âm thanh cần giữ lại, làm cho âm thanh đơn giản hơn và dễ nén hơn.

Điều này được minh họa trong sơ đồ dưới đây. Sơ đồ so sánh dải tần nghe của con người (màu xanh lá) với dải tần lời nói của con người (màu đỏ) và dải tần nơi phần lớn âm phát ra từ giọng người nằm trong đó (màu vàng).

![Sơ đồ cho thấy dải nghe của con người so với dải lời nói của con người](human-hearing-range.svg)

Sự khác biệt lớn giữa các dải này cho phép chúng ta đánh mất một phần chi tiết trong dữ liệu âm thanh mà không ảnh hưởng đáng kể đến khả năng tai người nhận ra thay đổi thật sự về chất lượng âm thanh. Có thể tận dụng các sự thật này khi nén âm thanh.

Bên cạnh việc đơn giản hóa âm thanh thông qua phân tích âm học tâm lý, codec còn dùng các thuật toán và phép biến đổi khác để tiếp tục đơn giản hóa và giảm kích thước âm thanh. Nếu bạn muốn tìm hiểu thêm về cách nén âm thanh hoạt động, hãy xem [Nén dữ liệu âm thanh](https://en.wikipedia.org/wiki/Data_compression#Audio) trên Wikipedia.

Quan trọng là, codec sẽ tự làm toàn bộ phần khó cho bạn. Đó là lý do tại sao có rất nhiều kỹ thuật và nghiên cứu khoa học đi vào việc tạo ra các thuật toán và codec mới. Việc của bạn chỉ là cân nhắc các lựa chọn và tình huống sử dụng của mình, rồi chọn codec phù hợp cho nhu cầu.

> [!NOTE]
> Để có hướng dẫn chi tiết hơn về việc chọn codec âm thanh, xem [Chọn codec âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#choosing_an_audio_codec).

## Tham số của bộ mã hóa không mất dữ liệu

Bộ mã hóa không mất dữ liệu có ít không gian hơn nhiều để thao tác âm thanh nhằm cải thiện tỷ lệ nén, do cần có khả năng tái tạo âm thanh gốc, điều này giới hạn số lượng tùy chọn có sẵn để cấu hình các bộ mã hóa này. Các tùy chọn thường xoay quanh việc chọn phương pháp mà bộ mã hóa dùng để thực hiện mã hóa, và mức thời gian cùng sức mạnh xử lý mà nó được phép tiêu tốn để làm việc đó.

Các tham số này khác nhau tùy codec, nhưng có thể bao gồm:

- Chỉ định các thuật toán cụ thể sẽ dùng trong từng giai đoạn của quá trình mã hóa
- Tham số cho các thuật toán đó, chẳng hạn như độ sâu dự đoán cần dùng khi mô hình hóa âm thanh
- Số lần quét khi phân tích âm thanh, hoặc số lần một thuật toán nhất định nên được chạy

## Tham số của bộ mã hóa mất dữ liệu

Phần lớn codec có các giá trị đầu vào mà bạn có thể tinh chỉnh để tối ưu hóa nén theo nhiều cách khác nhau, cho kích thước hoặc chất lượng. Khi dùng bộ mã hóa mất dữ liệu, chất lượng càng cao thì âm thanh đã mã hóa càng lớn. Vì vậy, phần lớn tùy chọn đều ảnh hưởng đến cả chất lượng lẫn kích thước theo một cách nào đó.

Bạn sẽ cần tham khảo tài liệu của phần mềm mã hóa bạn dùng để xác định những tùy chọn nào có sẵn; điều đó sẽ phụ thuộc vào codec và bản thân phần mềm mã hóa. Một số codec có nhiều giá trị để bạn điều chỉnh (một số trong đó có thể đòi hỏi hiểu biết sâu về cả âm học tâm lý lẫn thuật toán của codec), còn một số khác cung cấp tham số "quality" mà bạn có thể đặt, và nó sẽ tự động điều chỉnh nhiều thuộc tính của thuật toán.

### Bit rate

Có hai cách loại trừ lẫn nhau để kiểm soát chất lượng âm thanh đã nén bằng bit rate. Cách thứ nhất nhắm tới một bit rate trung bình cho dữ liệu đã mã hóa, còn cách thứ hai chỉ định một giá trị chất lượng cố định để nhắm tới trong khi cho phép bit rate thay đổi.

#### Bit rate trung bình

Cách đầu tiên để kiểm soát chất lượng của tệp đầu ra là chỉ định **Average Bit Rate** (**ABR**) mục tiêu khi mã hóa âm thanh. Bộ mã hóa sẽ cố tạo ra một tệp âm thanh đã mã hóa mà khi phát lại sẽ dùng trung bình số bit đã chỉ định cho mỗi giây âm thanh. Điều này kiểm soát chất lượng từ góc nhìn kích thước âm thanh đã mã hóa; bit rate càng cao thì chất lượng âm thanh thu được càng cao. Chất lượng âm thanh sẽ dao động theo thời gian khi cần để đạt được bit rate mục tiêu.

Khá giống ABR là **CBR** (**Constant Bit Rate**). Trong khi ABR cố giữ bit rate trung bình ở một mức cho trước, đồng thời cho phép dao động, CBR dùng một bit rate thật sự cố định trong toàn bộ thời lượng âm thanh. CBR chủ yếu được dùng trong các codec được thiết kế cho mục đích chỉ giọng nói, nơi dải tần và mức biến thiên thường rất nhỏ, cho phép mã hóa CBR hoạt động mà không gây dao động chất lượng âm thanh không thể chấp nhận.

#### Bit rate biến thiên

Mã hóa **Variable Bit Rate** (**VBR**) hoạt động bằng cách nhận vào bộ mã hóa một thiết lập **constant quality**. Thiết lập này chỉ ra mức chất lượng cần duy trì trong suốt âm thanh, cho phép bit rate dao động khi cần để đạt mức chất lượng đó. Ở những phần của âm thanh nơi việc nén có thể đạt dễ dàng với ảnh hưởng tối thiểu tới chất lượng, bit rate có thể rất thấp, trong khi ở những vùng phức tạp hơn, bit rate sẽ cao hơn.

### Băng thông tần số âm thanh

Một số codec cho phép bạn cấu hình trực tiếp băng thông tần số âm thanh, bằng cách chỉ định dải tần được phép, thiết lập giới hạn trên và/hoặc dưới, hoặc chỉ định một loại nguồn âm thanh xác định cách cấu hình thuật toán dựa trên tần số dự kiến của tín hiệu đầu vào.

Ngoài ra, một số codec hỗ trợ các kênh băng thông tần số giới hạn đặc biệt, chẳng hạn kênh LFE, vốn tự nhiên giới hạn dải tần sẵn có. Trong trường hợp LFE, băng thông tần số âm thanh bị giới hạn ở dải tần thích hợp để dùng cho loa siêu trầm hoặc thiết bị tăng cường trải nghiệm âm thanh tương tự.

Một số codec cung cấp các profile đặc biệt dành riêng cho những tình huống sử dụng nhất định, chẳng hạn VoIP; các profile này cũng có thể mặc định bao gồm các giới hạn đối với băng thông tần số âm thanh.

### Âm thanh stereo kết hợp

Âm thanh stereo thường được biểu diễn bằng các khung âm thanh chứa một mẫu cho mỗi kênh. Điều này tạo ra các khung âm thanh cần 2 lần _sampleSize_ bit mỗi khung, trong đó _sampleSize_ là số bit mà mỗi mẫu âm thanh sử dụng. Vì thế, với bản ghi âm stereo 16-bit, mỗi mẫu dùng không gian gấp 2 lần 16, tức 32 bit. Đây là stereo trái/phải (L/R) tiêu chuẩn hoặc **stereo đơn giản**.

**Âm thanh stereo kết hợp** là một phương pháp lưu mẫu âm thanh stereo theo cách tiết kiệm không gian hơn bằng cách xét đến việc âm thanh đi vào mỗi tai thường khá tương tự. Do đó, thay vì lưu từng bit của mẫu cho mỗi kênh, người ta lưu một biên độ cơ sở và một giá trị sai lệch biên độ theo từng kênh, trong đó giá trị sai lệch có thể dùng ít bit hơn so với một mẫu hoàn chỉnh.

Có hai loại âm thanh stereo kết hợp: mid-side và intensity. Trong suốt thời lượng một tệp âm thanh, bộ mã hóa có thể thay đổi định dạng đang được dùng để biểu diễn tín hiệu stereo trong suốt tệp.

#### Mã hóa stereo mid-side

**Mã hóa stereo mid-side** (**MS**) hoạt động bằng cách ghi lại các khung chứa một **kênh mid** cơ bản, là biên độ trung bình của hai kênh âm thanh trái và phải ban đầu. Về cơ bản, đây là giá trị bạn sẽ tính làm biên độ khi chuyển tín hiệu stereo sang mono. Sau đó bạn lưu giá trị **kênh side**; giá trị này là một con số có thể được cộng vào giá trị **kênh mid** để xác định biên độ gốc của kênh trái, và trừ khỏi giá trị mid để tính giá trị gốc của kênh phải.

Nói cách khác, với kênh trái L và kênh phải R, bạn thực hiện các phép tính sau khi mã hóa một mẫu:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi mathvariant="italic">mid</mi><mo>=</mo><mfrac><mrow><mi>L</mi><mo>+</mo><mi>R</mi></mrow><mn>2</mn></mfrac></mrow><annotation encoding="TeX">mid = \frac { L + R }{ 2 } </annotation></semantics>
</math>
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi mathvariant="italic">side</mi><mo>=</mo><mfrac><mrow><mi>L</mi><mo>-</mo><mi>R</mi></mrow><mn>2</mn></mfrac></mrow><annotation encoding="TeX">side = \frac { L - R }{ 2 }</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Sau đó bạn lưu các giá trị `mid` và `side`. Trong khi `mid` vẫn có cùng kích thước như kích thước mẫu của bạn (chẳng hạn 16 bit), giá trị `side` có thể được lưu bằng số bit ít hơn, vì biên độ của hai kênh có lẽ tương đối giống nhau. Khi đó bộ mã hóa có thể lấy tổng số bit ít hơn này trên mỗi khung và thực hiện các phép tính bổ sung để giảm kích thước thêm nữa.

Khi giải mã âm thanh, các giá trị tuyệt đối của kênh trái và phải được tính như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>L</mi><mo>=</mo><mi mathvariant="italic">mid</mi><mo>+</mo><mi mathvariant="italic">side</mi></mrow><annotation encoding="TeX">L\quad =\quad mid\quad +\quad side</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>R</mi><mo>=</mo><mi mathvariant="italic">mid</mi><mo>-</mo><mi mathvariant="italic">side</mi></mrow><annotation encoding="TeX">L\quad =\quad mid\quad -\quad side</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Bản thân mã hóa stereo mid-side là không mất dữ liệu, và được dùng phổ biến bởi cả codec âm thanh không mất dữ liệu lẫn mất dữ liệu. Mọi mất chi tiết đều đến từ các bước khác của quá trình mã hóa.

#### Mã hóa stereo cường độ

**Mã hóa stereo cường độ** giảm bitrate của âm thanh đã mã hóa bằng cách tận dụng cách con người xác định vị trí âm thanh trong không gian; điều này được gọi là [định vị âm thanh](https://en.wikipedia.org/wiki/Sound_localization). Chúng ta nghe stereo vì tai ta phát hiện âm thanh ở các thời điểm khác nhau tùy theo âm thanh đến từ đâu.

Điều này là vì hai tai của chúng ta cách nhau vài inch, do nằm ở hai phía đối diện của đầu. Một âm thanh đi từ bên phải sẽ đến tai phải trước khi đến tai trái. Bộ não xác định âm thanh đang ở vị trí nào trong không gian xung quanh bằng cách dùng chênh lệch thời gian đó để suy ra góc mà âm thanh đến từ. Tuy nhiên, khi tần số của tín hiệu âm thanh giảm xuống, bước sóng sẽ tăng lên. Cuối cùng, bước sóng tiến gần rồi vượt qua khoảng cách giữa hai tai, và việc định vị âm thanh một cách rõ ràng trở nên khó khăn hoặc không thể.

Với thông tin này, ta có thể biểu diễn gần đúng một tín hiệu âm thanh stereo bằng cách gộp các tần số không dùng để xác định hướng thành một kênh duy nhất, rồi thêm thông tin chỉ ra hướng của âm thanh. Cách này cần ít bit hơn để biểu diễn, nhưng bản chất là có mất dữ liệu ở một mức nào đó.

## Xem thêm

- [Hướng dẫn codec âm thanh được dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs)
