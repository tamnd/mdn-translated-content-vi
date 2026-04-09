---
title: Trợ năng web cho người bị co giật và phản ứng thể chất
short-title: Ngăn ngừa co giật và phản ứng thể chất
slug: Web/Accessibility/Guides/Seizure_disorders
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này giới thiệu các khái niệm đằng sau việc làm cho nội dung web có thể truy cập đối với những người mắc rối loạn tiền đình, và cách đo lường cũng như ngăn chặn nội dung dẫn đến co giật và/hoặc các phản ứng thể chất khác.

## Tổng quan

### Co giật

Các cơn co giật do ánh sáng gây ra được gọi là động kinh nhạy sáng. Nội dung nhấp nháy, lóe sáng hoặc chớp tắt có thể kích hoạt tình trạng này. Các công nghệ web dùng video, GIF động, PNG động, SVG động, {{Glossary("Canvas")}}, và các hoạt ảnh CSS hoặc JavaScript đều có thể tạo ra nội dung gây co giật hoặc phản ứng thể chất làm suy giảm khả năng hoạt động. Một số mẫu hình trực quan, đặc biệt là sọc, cũng có thể gây phản ứng dù không hề chuyển động. Động kinh nhạy sáng thực ra là một dạng "động kinh phản xạ" - cơn co giật xảy ra do một tác nhân kích thích. Với động kinh nhạy sáng, tác nhân thường là ánh sáng chớp, nhưng các dạng động kinh phản xạ khác có thể bị kích thích bởi việc đọc hoặc bởi âm thanh. Mẫu hình và hình ảnh cũng có thể kích hoạt động kinh.

Việc ảnh tĩnh có thể gây co giật và các rối loạn khác đã được ghi nhận trong các bài viết như ["Gamma Oscillations and photosensitive epilepsy"](https://linkinghub.elsevier.com/retrieve/pii/S0960982217304062), trong đó nêu rằng "_một số hình ảnh trực quan, ngay cả khi không có chuyển động hay nhấp nháy, cũng có thể kích hoạt cơn co giật ở người bị động kinh nhạy sáng_". Quỹ Động kinh (Epilepsy Foundation), trong bài ["Shedding Light on Photosensitivity, One of Epilepsy's Most Complex Conditions"](https://www.epilepsy.com/stories/shedding-light-photosensitivity-one-epilepsys-most-complex-conditions), cũng nhấn mạnh ảnh tĩnh và mẫu hình: "_Các mẫu sọc sáng và tối tĩnh hoặc chuyển động có tác dụng giống ánh sáng nhấp nháy vì các vùng sáng và tối luân phiên nhau._" Nhóm công tác của Epilepsy Foundation of America còn “định lượng” được phần nào vấn đề: _"Một mẫu có khả năng gây co giật chứa các sọc phân biệt rõ ràng, với hơn năm cặp sọc sáng-tối theo bất kỳ hướng nào."_ Ngoài sọc, các mẫu caro cũng đã được biết là gây co giật nhạy sáng, theo [Cedars-Sinai](https://www.cedars-sinai.org/health-library/diseases-and-conditions/p/photosensitive-seizures.html).

Mặc dù ảnh tĩnh cũng có thể là tác nhân, chúng kém nhất quán hơn. Tác nhân đã được xác định rõ và mạnh nhất là đèn chớp/nhấp nháy. Bác sĩ Selim Benbadis thuộc Chương trình Động kinh Toàn diện của USF lưu ý rằng _"điều duy nhất thực sự được ghi nhận là ánh sáng nhấp nháy, có thể kích hoạt cơn co giật ở người bị động kinh nhạy sáng. Tuy nhiên, chỉ một số ít loại động kinh là nhạy sáng, và đa số các trường hợp động kinh thì không."_ Ngoài các cơn co giật do nhạy sáng, việc nghe một số bản nhạc cũng có thể kích hoạt cái gọi là co giật do âm nhạc (musicogenic seizures), dù loại này có vẻ hiếm hơn nhiều. Để có phần giới thiệu tốt về chủ đề này, hãy xem trang [Musicogenic Seizures](https://epilepsyontario.org/musicogenic-seizures/) của Epilepsy Ontario.

Co giật và động kinh không phải là một. Trong bài ["A Revised Definition of Epilepsy"](https://www.epilepsy.com/stories/revised-definition-epilepsy), Epilepsy Foundation lưu ý rằng _"cơn co giật là một sự kiện và động kinh là bệnh lý liên quan đến các cơn co giật tái diễn không được kích thích"_. Theo trang ["How Serious Are Seizures?"](https://www.epilepsy.com/what-is-epilepsy/understanding-seizures/how-serious-are-seizures) của Epilepsy Foundation, _"tử vong đột ngột không ngờ do động kinh (SUDEP) có lẽ là nguyên nhân tử vong liên quan đến bệnh lý phổ biến nhất ở người mắc động kinh. Không thường xuyên, nhưng là một vấn đề có thật và mọi người cần nhận thức được rủi ro này"_.

Điều quan trọng là co giật hoàn toàn có thể gây tử vong, và nhà phát triển cùng nhà thiết kế có vai trò rất lớn trong việc làm cho web trở thành nơi an toàn hơn cho những người nhạy cảm với các tác nhân nhạy sáng hoặc do âm nhạc.

Co giật có thể gây chết người, nhưng ngay cả những cơn "chỉ" làm suy kiệt cũng có thể đủ nặng để khiến người dùng mất khả năng hoạt động. Các rối loạn khác như mất phương hướng, buồn nôn, nôn, và nhiều vấn đề khác cũng có thể nặng đến mức làm người dùng không thể tiếp tục sử dụng. Bài viết ["Photosensitivity and Seizures"](https://www.epilepsy.com/what-is-epilepsy/seizure-triggers/photosensitivity) của Epilepsy Foundation liệt kê nhiều tác nhân có thể gây co giật ở người nhạy sáng; dưới đây là một phần trong danh sách đó:

- Màn hình TV hoặc màn hình máy tính do hiện tượng nhấp nháy hay ảnh cuộn.
- Một số trò chơi video hoặc chương trình truyền hình có các đợt chớp nhanh hoặc các mẫu luân phiên của những màu khác nhau.
- Đèn chớp mạnh như còi báo cháy trực quan.
- Ánh sáng tự nhiên, như ánh sáng mặt trời, đặc biệt khi phản chiếu trên mặt nước, xuyên qua tán cây hoặc qua các nan rèm Venetian.
- Một số mẫu hình trực quan, đặc biệt là sọc có màu tương phản.

Cũng trong bài viết đó, họ nói rằng nhiều yếu tố phải kết hợp mới kích hoạt được phản ứng nhạy sáng. Đáng chú ý là bước sóng ánh sáng cũng là một yếu tố khả dĩ; các bước sóng ở vùng đỏ của quang phổ dường như đặc biệt gây vấn đề. Trong bài ["Understanding WCAG 2.0 Three Flashes or Below Threshold"](https://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure-does-not-violate.html), tài liệu này cũng nêu chung rằng: _"Những người có rối loạn co giật nhạy sáng có thể bị kích hoạt cơn co giật bởi nội dung nhấp nháy ở một số tần số nhất định trong hơn vài nhịp chớp"_ và rất cụ thể rằng: _"Mọi người còn nhạy với nhấp nháy màu đỏ hơn các màu khác, nên có một bài kiểm tra đặc biệt cho nhấp nháy đỏ bão hòa"_.

Bạn thậm chí không cần ảnh hay video để gây hại. Một phần tử {{HTMLElement('div')}} được đặt thay đổi màu sắc và độ sáng với tần suất cao, điều rất dễ làm bằng JavaScript, cũng có thể gây hại thực sự. Và hiện tượng nhấp nháy có thể xuất hiện ở khắp nơi. Ví dụ, các "spinner" thường dùng để hiển thị khi trang đang tải có thể rất dễ "nhấp nháy" khi quay.

Cũng cần lưu ý tới các vấn đề đối với người có khó khăn về vận động. Ví dụ, trang về [Photosensitive Epilepsy Analysis Tool](https://trace.umd.edu/peat/) của Trace Research & Development Center ghi rằng _"Co giật nhạy sáng có thể bị kích hoạt bởi một số kiểu nhấp nháy trong nội dung web hoặc máy tính, bao gồm các hiệu ứng rê chuột làm một vùng lớn trên màn hình chớp tắt liên tục"_.

### Các phản ứng thể chất khác

Buồn nôn, chóng mặt (hay hoa mắt), và mất phương hướng là các triệu chứng khá chung, liên quan đến nhiều loại bệnh và không đặc biệt gợi ý co giật (trừ có lẽ mất phương hướng, vốn cũng có thể thấy trong co giật). Tuy nhiên, co giật không phải là phản ứng thể chất bất lợi duy nhất có thể xảy ra do chớp sáng, nhấp nháy, lóe tắt, và các kích thích tương tự. Năm 1997, một bộ phim hoạt hình Nhật Bản có một "quả bom vi-rút" hoạt hình. Một số trẻ em xem phim đã bị co giật, số khác buồn nôn, run rẩy, và nôn ra máu. Phản ứng của trẻ em nghiêm trọng đến mức phải đưa tới phòng cấp cứu. Các rối loạn thể chất dưới đây đều là hậu quả có thể xảy ra: mỗi phản ứng đều có thể đủ nặng để làm người dùng mất khả năng hoạt động.

- Co giật
- Rối loạn tiền đình
- Đau nửa đầu
- Buồn nôn
- Nôn

## Nhấp nháy, chớp tắt, và lóe sáng

Mặc dù "flash" và "blink" đôi khi được dùng thay thế cho nhau, chúng không giống nhau. Theo W3C, blinking là vấn đề gây xao nhãng, còn flashing là nội dung xảy ra hơn 3 lần mỗi giây và đủ lớn, đủ sáng. [Section 508](https://www.section508.gov/content/guide-accessible-web-design-development/#flashing) cấm các hiệu ứng nhấp nháy có tần số lớn hơn 3 Hz (nhịp nhấp nháy mỗi giây) và nhỏ hơn 55 Hz. Bài ["Shedding Light on Photosensitivity, One of Epilepsy's Most Complex Conditions"](https://www.epilepsy.com/stories/shedding-light-photosensitivity-one-epilepsys-most-complex-conditions) của Epilepsy Foundation lưu ý rằng _"Nhìn chung, ánh sáng nhấp nháy trong khoảng từ năm đến 30 lần mỗi giây (Hertz) có khả năng gây co giật cao nhất. Để an toàn, đồng thuận khuyến nghị người nhạy sáng không nên bị phơi nhiễm với số nhịp chớp lớn hơn ba lần mỗi giây."_ Tuy nhiên, với một số người, nhấp nháy/chớp tắt có thể gây triệu chứng ở mức dưới 3 Hz.

Cần lưu ý rằng không phải mọi nhấp nháy và chớp tắt đều xấu. NASA, trong tài liệu ["Blinking, Flashing, and Temporal Response"](https://web.archive.org/web/20250215094718/https://colorusage.arc.nasa.gov/flashing.php), lưu ý rằng nhấp nháy và chớp sáng có thể là công cụ mạnh để thu hút chú ý - điều cần thiết cho các nút cảnh báo (giả định rằng người dùng vẫn có thể thấy màn hình khi phần tử đang nhấp nháy, điều này không phải lúc nào cũng đúng). Với một số người dùng, nút nhấp nháy cũng cần được dùng tiết kiệm và thận trọng. Khi áp dụng cho thiết kế web, các hệ thống cảnh báo nhân viên về nguy hiểm bằng cách "chiếm quyền" màn hình để hiển thị cảnh báo khẩn cấp nhấp nháy cần tính đến tốc độ, kích thước, và độ sáng thay đổi trên màn hình trong lúc các cảnh báo này đang nhấp.

### Nhấp nháy và lóe sáng - nguy hiểm được lượng hóa như thế nào?

Theo bài ["Photic- and pattern-induced seizures: expert consensus of the Epilepsy Foundation of America Working Group"](https://onlinelibrary.wiley.com/doi/epdf/10.1111/j.1528-1167.2005.31405.x), _"Một nhịp chớp là mối nguy tiềm tàng nếu có độ chói ≥20 cd/m<sup>2</sup>, xảy ra với tần số ≥3 Hz, và chiếm một góc nhìn đặc rắn ≥0,006 steradian (xấp xỉ 10% trường nhìn trung tâm hoặc 25% diện tích màn hình ở khoảng cách xem điển hình)."_

Khoảng cách xem điển hình là bao xa? Khuyến nghị được cân nhắc vào thời điểm viết bài cho khoảng cách xem điển hình là _"có thể xem xét diện tích lớn hơn 25% diện tích màn hình TV, giả định khoảng cách xem chuẩn ≥2 m (khoảng 9 feet)"_. Từ đó đến nay nhiều thứ đã thay đổi, và giờ chúng ta thường ở gần màn hình hơn nhiều.

Các màu nhất định, và/hoặc sự kết hợp màu nhất định, cũng quan trọng. Bài ["Certain Colors More Likely To Cause Epileptic Fits, Researchers Find"](https://www.sciencedaily.com/releases/2009/09/090925092858.htm) lưu ý rằng _"những phức tạp bên dưới động học não có thể bị điều biến bởi một số tổ hợp màu nhiều hơn các tổ hợp khác; ví dụ, kích thích nhấp nháy đỏ-xanh lam gây kích thích vỏ não lớn hơn đỏ-xanh lá hoặc xanh lam-xanh lá."_

### Nhấp nháy & nhấp nháy đỏ

[Các ngưỡng nháy chung và nháy đỏ của WCAG 2.3.1](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html) được định nghĩa như sau:

- Một **nháy chung** được định nghĩa là một cặp thay đổi đối nghịch trong [độ chói tương đối](https://w3c.github.io/wcag/guidelines/22/#dfn-relative-luminance) từ 10% trở lên của độ chói tương đối tối đa, trong đó độ chói tương đối của hình tối hơn thấp hơn 0,80, và "một cặp thay đổi đối nghịch" là tăng rồi giảm, hoặc giảm rồi tăng;
- Một **nháy đỏ** được định nghĩa là bất kỳ cặp chuyển tiếp đối nghịch nào có liên quan đến một màu đỏ bão hòa.

Các tiêu chuẩn này dựa trên những nghiên cứu trước đó. Năm 2004, Epilepsy Foundation of America tổ chức một hội thảo và xây dựng [đồng thuận](https://pubmed.ncbi.nlm.nih.gov/16146438/) về co giật nhạy sáng, nêu rằng _"Một nhịp chớp là mối nguy tiềm tàng nếu có độ chói ít nhất 20 cd/m<sup>2</sup>, xảy ra với tần số ít nhất 3 Hz, và chiếm một góc nhìn đặc rắn ít nhất 0,006 steradian (khoảng 10% trường nhìn trung tâm hoặc 25%..."_.

Khi thiết kế nội dung chớp sáng, điều quan trọng là chỉ hiển thị không quá năm cặp sọc sáng-tối nếu các sọc đổi hướng, dao động, nhấp nháy, hoặc đảo tương phản; nếu mẫu không đổi hoặc trôi mượt theo một hướng, không quá tám sọc. Các nguyên tắc này dễ áp dụng hơn với media tĩnh, ví dụ một chương trình TV đã ghi sẵn, có thể phân tích từng khung hình, so với media tương tác.

Đơn vị "cd/m<sup>2</sup>" là candela trên mét vuông. Vậy với nhà phát triển web, điều này liên quan thế nào tới phép đo màu sắc, độ chói, và độ bão hòa?

Candela là đơn vị SI (Hệ đo lường quốc tế) của cường độ sáng. Đây là một thuật ngữ quang trắc, và quang trắc liên quan đến đo ánh sáng nhìn thấy được theo cách mắt người cảm nhận. Bài viết Wikipedia về ["Candela per square metre"](https://en.wikipedia.org/wiki/Candela_per_square_metre) diễn đạt nó theo cách quen thuộc với nhà phát triển: trên thiết bị hiển thị và trong không gian RGB. Điều này hữu ích vì có một chuẩn cụ thể được giả định dùng trên màn hình, máy in, và Internet, đó là **sRGB** (standard Red Green Blue).

> Là thước đo ánh sáng phát ra trên mỗi đơn vị diện tích, đơn vị này thường dùng để chỉ độ sáng của thiết bị hiển thị. Đặc tả [sRGB](https://en.wikipedia.org/wiki/SRGB) cho màn hình nhắm tới 80 cd/m<sup>2</sup>. Thông thường, màn hình được hiệu chuẩn nên có độ sáng 120 cd/m<sup>2</sup>. Hầu hết màn hình LCD máy tính để bàn phổ thông có độ chói từ 200 đến 300 cd/m<sup>2</sup>. [TV độ nét cao](https://en.wikipedia.org/wiki/High-definition_television) dao động từ 450 đến khoảng 1500 cd/m<sup>2</sup>.

Điểm rút ra là không gian màu **sRGB** là điểm giao chung quan trọng giữa nghiên cứu, công cụ đánh giá, và nhà phát triển, vì nó có thể dễ dàng chuyển đổi từ mã Hex thường dùng.

### Sinh lý và tâm lý con người như một yếu tố cần cân nhắc

Nhiều chuyên gia cố gắng lượng hóa và đo đạc tối đa có thể những loại nội dung web có thể trở thành tác nhân gây co giật. Tuy vậy, không thể quên rằng màu sắc vừa liên quan đến nhận thức của con người trong não, vừa liên quan đến phép đo ánh sáng phát ra từ màn hình máy tính.

Ngoài khác biệt về tâm lý, giữa chúng ta còn có khác biệt sinh lý. Cách một con người thật cảm nhận và phản ứng với màu sắc và ánh sáng sẽ có khác biệt và sắc thái. Ví dụ, Tom Jewett, Giảng viên Danh dự ngành Khoa học Máy tính tại Cal State University Long Beach, lưu ý về [độ sáng trong thang màu HSL](https://colortutorial.design/hsb.html) rằng _"…Sự phân biệt giữa các mức độ sáng thực ra không tuyến tính như thang HSL ngụ ý; chúng ta nhạy hơn nhiều với thay đổi ở vùng sáng hơn so với vùng tối hơn."_

Điều quan trọng là ánh sáng và các phép đo của nó là tuyến tính, nhưng thị giác và nhận thức của con người thì không. Việc tìm hiểu và thảo luận về cách liên hệ phép đo máy móc của ánh sáng khi nó đi từ màn hình máy tính, qua khoảng cách tới mắt người, được lọc qua thị giác, rồi được não người xử lý, vẫn đang tiếp tục.

Ngay cả tuổi tác và giới tính cũng có thể ảnh hưởng. Theo bài ["Shedding Light on Photosensitivity, One of Epilepsy's Most Complex Conditions"](https://www.epilepsy.com/stories/shedding-light-photosensitivity-one-epilepsys-most-complex-conditions), _"Trẻ em và thanh thiếu niên dễ có phản ứng bất thường với kích thích ánh sáng hơn người lớn, và cơn co giật đầu tiên do ánh sáng gần như luôn xảy ra trước tuổi 20"_. Bài viết tiếp tục với thống kê: _"Nữ giới (60 phần trăm) bị ảnh hưởng thường xuyên hơn nam giới (40 phần trăm), mặc dù co giật phổ biến hơn ở nam giới vì họ có xu hướng chơi trò chơi điện tử nhiều hơn. Trò chơi điện tử thường chứa các kích thích ánh sáng có khả năng gây kích thích"_.

**Kiểm thử với người dùng là rất có vấn đề**. Tự nhiên là không ai muốn đưa một người dễ co giật vào bài kiểm thử người dùng. Điều đó rất nguy hiểm. Vì vậy, một trong những việc có trách nhiệm nhất mà nhà phát triển và nhà thiết kế có thể làm là dùng các công cụ đã được các chuyên gia trong lĩnh vực phát triển cùng bác sĩ thực hiện. Tại thời điểm viết bài này, có hai công cụ phổ biến được phát triển một cách có đạo đức và chuyên nghiệp bởi các nhà nghiên cứu và bác sĩ cho phim/video: **PEAT** và **Harding Test**.

### Photosensitive Epilepsy Analysis Tool (PEAT)

[Trace Research and Development Center](https://trace.umd.edu/) đã thiết lập chuẩn mực cho [Photosensitive Epilepsy Analysis Tool](https://trace.umd.edu/peat/), và họ đã chủ động cho phép tải xuống **_miễn phí_**. PEAT có thể giúp tác giả xác định liệu hoạt ảnh hoặc video trong nội dung của họ có khả năng gây co giật hay không. Lưu ý hạn chế khi sử dụng: **_Việc dùng PEAT để đánh giá tài liệu sản xuất thương mại cho truyền hình, phim ảnh, giải trí gia đình, hoặc ngành game là bị cấm. Hãy dùng Harding Test hoặc công cụ khác cho mục đích thương mại._**

Để lấy bản miễn phí của Photosensitive Epilepsy Analysis Tool của University of Maryland, hãy truy cập [Trace Research & Development Center](https://trace.umd.edu/).

![University of Maryland College of Information Studies Photosensitive Epilepsy Analysis Tool.](peatversion1pt6.png)

### Harding Test

Vì việc dùng công cụ PEAT bị cấm cho mục đích thương mại, các nhà sản xuất chương trình truyền hình có thể dùng Harding Test tại [HardingTest.com](https://hardingtest.com/). Harding Test cũng là một chuẩn vàng khác. Các nhà sản xuất truyền hình ở nhiều quốc gia phải vượt qua bài kiểm tra này trước khi phát sóng, nên nhóm tại [HardingTest.com](https://hardingtest.com/) cung cấp cả phân tích và chứng nhận cho nội dung video.

![Harding Flash and Pattern Analyzer.](screen_shot_2019-06-20_at_11.16.17_am.png)

## Giải pháp trợ năng cho nhà phát triển

Mọi hoạt ảnh đều có tiềm ẩn nguy hiểm. Với tư cách nhà thiết kế và nhà phát triển, trách nhiệm của chúng ta là bảo đảm không gây hại, dù vô tình hay cố ý. Nếu buộc phải đưa vào thứ gì đó có khả năng gây hại, điều quan trọng là ngăn người dùng vô tình gặp nội dung độc hại và cung cấp cách để người dùng ngăn chặn cũng như kiểm soát hoạt ảnh nhằm giảm thiểu nguy cơ.

### Nhà phát triển web có thể làm gì

#### Không gây hại

[WCAG Guideline 2.3 Seizures and Physical Reactions](https://www.w3.org/WAI/standards-guidelines/wcag/new-in-21/) cung cấp một cái nhìn tổng quan: _"Đừng thiết kế nội dung theo cách được biết là gây co giật hoặc phản ứng thể chất"_. Đừng đưa vào hoạt ảnh mà người dùng không thể kiểm soát. Đừng thiết kế bằng các mẫu hình đã biết là gây vấn đề. Nếu buộc phải đưa một gif hoặc png có nhấp nháy, hãy ghi nó sang định dạng video để người dùng có thể điều khiển. Hãy cho người dùng khả năng tránh nó, tắt nó, hoặc làm cho nó bớt nguy hại hơn.

#### Hiểu về ý đồ xấu

Với tư cách nhà phát triển hoặc nhà thiết kế, hãy tự hỏi liệu nội dung chớp sáng có thật sự cần xuất hiện trên trang web của bạn hay không. Ngay cả khi xử lý đúng cách, vẫn có người tải nội dung gây hại từ trang của bạn và biến nó thành vũ khí. Vụ việc được ghi nhận đầu tiên về việc dùng máy tính để gây hại thể chất qua hoạt ảnh được cho là bắt đầu vào thứ Bảy, ngày 22 tháng 3 năm 2008: website của Epilepsy Foundation bị tấn công bằng các bài đăng có hình nhấp nháy và liên kết giả mạo rằng chúng có ích. Người dùng có rối loạn tiền đình đang tìm kiếm sự giúp đỡ từ trang này đã bị ảnh hưởng.

Một loạt cân nhắc pháp lý đã được đặt ra sau khi nhà báo Kurt Eichenwald, một người mắc động kinh đã biết, bị co giật sau khi nhận một gif động vào tháng 12 năm 2016: gif nhấp nháy có thông điệp _"You deserve a seizure for your posts"_.

#### Kiểm soát mức độ tiếp xúc, kiểm soát quyền truy cập

Kiểm soát việc người dùng có được tiếp xúc với trang hay không là chìa khóa để bảo đảm người dễ co giật không vô tình bị tiếp xúc. WCAG lưu ý rằng chỉ một đối tượng đơn lẻ cũng có thể làm cho toàn bộ trang không sử dụng được.

Nếu bạn nghĩ rằng mình có thể có một hình ảnh hoặc hoạt ảnh gây co giật, hãy kiểm soát truy cập bằng cách trước tiên hiển thị cảnh báo về nội dung, sau đó đặt nó ở nơi người dùng phải chủ động chọn mới xem được, chẳng hạn bằng cách nhấp nút, hoặc bảo đảm rằng liên kết tới trang đó có cảnh báo rõ ràng và dễ nhận biết.

Hãy cân nhắc thiết lập chỉ thị crawl cho công cụ tìm kiếm để gợi ý rằng chúng không nên đưa các tài nguyên có thể gây hại vào chỉ mục tìm kiếm. Bạn có thể làm điều này bằng siêu dữ liệu trong phần tử [`<meta name="robots">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots) với các quy tắc hạn chế như `noindex, nofollow`. Bằng cách không lập chỉ mục trang (`noindex`) và không theo liên kết trên trang (`nofollow`), xác suất người dùng tình cờ gặp nội dung này qua tìm kiếm sẽ giảm:

```html
<html lang="en">
  <head>
    <title>…</title>
    <meta name="robots" content="noindex, nofollow" />
  </head>
  <body>
    …
  </body>
</html>
```

Với tài nguyên không phải HTML, bạn có thể đặt chỉ thị crawl trong header HTTP {{httpheader("X-Robots-Tag")}}:

```http
X-Robots-Tag: noindex
```

### GIF động

Mọi loại ảnh đều có thể nguy hiểm, nhưng GIF động đáng được nhắc riêng vì tính phổ biến của nó và vì tốc độ hoạt ảnh thực sự được điều khiển ngay bên trong file GIF.

#### Phát hiện GIF có động hay không

- Gói npm [animated-gif-detector](https://www.npmjs.com/package/animated-gif-detector) cho phép xác định ảnh động _sớm nhất có thể_ trong một yêu cầu HTTP.
- Zakirt cung cấp một gist cho [animated-gif-detect.js](https://gist.github.com/zakirt/faa4a58cec5a7505b10e3686a226f285)

Với GIF động, hãy bảo đảm hoạt ảnh không chạy cho tới khi người dùng chọn kích hoạt. Ví dụ, người dùng phải bấm nút hoặc đánh dấu một ô kiểm để bắt đầu hoạt ảnh.

### Video

Cũng như với GIF động, người dùng phải bấm nút hoặc đánh dấu hộp kiểm để bắt đầu hoạt ảnh. Có nhiều cách để làm việc này, như KHÔNG thêm thuộc tính [`autoplay`](/en-US/docs/Web/API/HTMLMediaElement/autoplay) vào `<video controls>`, hoặc đặt {{CSSxRef('animation-play-state')}} thành `paused` ở trạng thái ban đầu. Để xem một ví dụ mạnh về cách này hoạt động, hãy xem bài của Kirupa, ["Toggling Animations On and Off"](https://www.kirupa.com/html5/toggling_animations_on_off.htm). Kirupa dùng `animation-play-state` kết hợp với {{CSSxRef('transition')}}, {{CSSxRef('transform')}}, và [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) để tạo ra trải nghiệm rất có thể truy cập dưới sự kiểm soát của người dùng.

{{cssxref("animation-play-state")}} là thuộc tính CSS đặt việc một hoạt ảnh đang chạy hay đang tạm dừng.

```css
div {
  animation-play-state: paused;
}
```

[CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions) có thể được dùng để đặt thời lượng về 0 ở giai đoạn đầu của hoạt ảnh.

```css
div {
  transition-duration: 0s;
}
```

### Bảo đảm người dùng có thể dừng hoạt ảnh cũng như khởi động chúng

Phần tử {{HTMLElement('video')}} không có thuộc tính nào sẽ không tự phát, và cũng sẽ không có điều khiển. Hãy bảo đảm bạn thêm thuộc tính `controls` vào phần tử video để người dùng có thể dừng video cũng như bắt đầu nó.

```html
<video controls>
  <source src="video.mp4" type="video/mp4" />
  <source src="video.ogg" type="video/ogg" />
  Your browser does not support the video tag.
</video>
```

#### Bảo đảm điều khiển sẵn có bằng lập trình

Thuộc tính `HTMLMediaElement.controls` phản ánh thuộc tính HTML `controls`, điều khiển việc các phần tử điều khiển giao diện để phát media có được hiển thị hay không.

##### Video

Để bảo đảm video có các điều khiển mà người dùng có thể truy cập, hãy thêm từ "controls" vào các phần tử video và audio HTML.

`<video controls>`

```html
<video controls>
  <source src="myVideo.mp4" type="video/mp4" />
  <source src="myVideo.webm" type="video/webm" />
  <p>
    Trình duyệt của bạn không hỗ trợ video HTML. Đây là
    <a href="myVideo.mp4">liên kết tới video</a> thay thế.
  </p>
</video>
```

##### Audio

Áp dụng ví dụ đó cho audio:

`<audio controls>`

```html
<audio controls>
  <source src="myAudio.ogg" type="audio/ogg" />
  <source src="myAudio.mp3" type="audio/mpeg" />
  <p>
    Trình duyệt của bạn không hỗ trợ phần tử audio. Đây là
    <a href="myAudio.mp3">liên kết tới âm thanh</a> thay thế.
  </p>
</audio>
```

##### Audio là một phần của Video

Lưu ý rằng âm thanh trong video có thể được điều khiển bằng thuộc tính nội dung `muted`, dù nội dung nằm trong phần tử {{HTMLElement('video')}} chứ không phải {{HTMLElement('audio')}}. Ví dụ này lấy từ phần mô tả về [muted media attribute](https://html.spec.whatwg.org/multipage/media.html#concept-media-muted) trong HTML Living Standard. Nó giải thích rằng video sẽ tự phát trong nền một cách im lặng cho tới khi người dùng chủ động bật tiếng.

```html
<video src="adverts.cgi?kind=video" controls autoplay loop muted></video>
```

### Kiểm soát tốc độ

Điều này có vẻ hiển nhiên, nhưng vì có rất nhiều kiểu MIME, cơ chế xử lý chúng rất khác nhau, nên không có một giải pháp phù hợp cho mọi trường hợp. Vấn đề còn phức tạp hơn do cách phân loại file cũng ảnh hưởng đến cách chúng nên được xử lý. Ví dụ, định dạng .gif thường được hiểu là ảnh, nhưng ở một số nơi lại được xem là định dạng video vì khả năng động của nó. Để xem danh sách đầy đủ các kiểu media, hãy truy cập trang [Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml) của IANA.org.

Việc nhận diện chúng không phải là trò chơi đơn giản. Bạn có thể quan tâm đến tiêu chuẩn [MIME Sniffing](https://mimesniff.spec.whatwg.org/) tại whatwg.org. Hầu như mọi loại ảnh đều có thể được làm động; cách chúng được làm động khác nhau, và do đó cách điều khiển hoạt ảnh cũng khác nhau.

#### Các kiểu file thường có thể làm động

- **Bitmap**: Hoạt ảnh
- **Canvas**: Bài hướng dẫn Canvas của MDN có một phần tuyệt vời về [basic animations](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations). `setInterval()` là công cụ quen thuộc trong hoạt ảnh Canvas, nhưng cũng thú vị khi xem nó tương tác với việc làm mới màn hình. Xem bài ["Controlling fps with requestAnimationFrame?"](https://stackoverflow.com/questions/19764018/controlling-fps-with-requestanimationframe) để thấy cách họ bàn về các chi tiết triển khai `requestAnimationFrame` trong bối cảnh làm mới màn hình.
- **GIFs (Raster)**: Khó xử lý vì khả năng điều khiển hoạt ảnh nằm ngay trong file gif. Để biết cách điều khiển tốc độ GIF, xem kỹ thuật W3C ["G152: Setting animated gif images to stop blinking after n cycles (within 5 seconds)"](https://www.w3.org/TR/WCAG20-TECHS/G152.html). Một bài Stack Overflow hữu ích là ["Can you control GIF animation with JavaScript?"](https://stackoverflow.com/questions/2385203/can-you-control-gif-animation-with-javascript)
- **GIFV (Raster)**: Được xem là biến thể, phiên bản video của GIF. Định dạng này không được chuẩn hóa, và phải tham chiếu tới một file video "thật" (ví dụ .webm) tồn tại ở nơi khác.
- **JPG (Raster)**
- **MNG (Raster)**: Multiple-image Network Graphics là định dạng đồ họa cho ảnh động. Một số người cũng xem đây là định dạng video.
- **PNG, APNG (Raster)**: Portable Network Graphics và Animated Portable Network Graphics đều có thể động.
- **SVGs (Vector)**: Tài liệu MDN ["SVG: Scalable Vector Graphics"](/en-US/docs/Web/SVG) lưu ý rằng _"SVG là một chuẩn web mở dựa trên văn bản. Nó được thiết kế rõ ràng để làm việc với các chuẩn web khác như [CSS](/en-US/docs/Web/CSS), [DOM](/en-US/docs/Web/API/Document_Object_Model), và [SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)."_ SVG có thể dùng như ảnh, như ví dụ `<img src="example.svg" alt="This is an image using a svg as a source">`. Điều này có nghĩa là giao diện và hoạt ảnh SVG có thể được điều khiển qua keyframes và hoạt ảnh CSS. Với tương tác bằng JavaScript, xem các tài liệu MDN về [SVG Interfaces](/en-US/docs/Web/API/Document_Object_Model#svg_dom) và [Applying SVG effects to HTML content](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content).
- **Voxel (Raster)**: Đồ họa raster ba chiều [voxel](https://en.wikipedia.org/wiki/Voxel) được dùng trong trò chơi điện tử cũng như trong ảnh y khoa.

#### Văn bản cũng có thể được làm động

Các phép dịch và biến đổi có thể làm văn bản trong một `div` chuyển động và gây hại. Văn bản chuyển động có thể gây co giật vì cùng lý do như ảnh chuyển động, nên hãy tránh làm động văn bản của bạn. Tốt nhất là tránh dùng văn bản chuyển động nói chung, vì nhiều trình đọc màn hình không đọc được văn bản đang chuyển động và đó cũng là trải nghiệm tệ ngay cả với người không có vấn đề về thị giác hay tiền đình.

### CSS cho hoạt ảnh

Trong stylesheet hoặc bên trong phần tử {{HTMLElement('style')}}, nhiều tùy chọn có thể kết hợp để tạo trải nghiệm mạnh cho người dùng. Chúng ta đã nhắc đến thuộc tính `animation` ở phần trước của tài liệu này. Thực ra nó là thuộc tính viết tắt cho tất cả các thuộc tính hoạt ảnh, bao gồm:

- `animation-play-state`
- `animation-duration` có giá trị `<time>`; đây là thời lượng một hoạt ảnh hoàn thành một vòng. Có thể chỉ định bằng giây `(s)` hoặc mili giây `(ms)`. Giá trị mặc định `0s` nghĩa là không có hoạt ảnh nào xảy ra.
- `animation-timing-function`

Thuộc tính animation tự nó đã mạnh, nhưng khi kết hợp với các thuộc tính và truy vấn khác như `prefers-reduced-motion`, bạn có thể thiết lập một tập tùy chọn mạnh cho người dùng. Đặt `animation-duration` và `transition-duration` thành thời lượng ngắn thay vì đặt `animation: none` và `transition: none` giúp có thêm cơ chế an toàn trong trường hợp việc chạy hoạt ảnh là phụ thuộc cần thiết.

### Hoạt ảnh bằng JavaScript

JavaScript thường được dùng để điều khiển các phần tử {{HTMLElement('canvas')}} và SVG. Phần lớn mã JavaScript áp dụng cho video HTML cũng áp dụng cho audio. `HTMLMediaElement.playbackRate` được dùng để triển khai điều khiển tốc độ phát cho cả video và audio. Giá trị 1.0 là mặc định và được xem là tốc độ bình thường; giá trị 0.5 là nửa tốc độ, 2.0 là gấp đôi tốc độ. Một số âm sẽ phát ngược video hoặc audio. Đặt thuộc tính tốc độ phát: `HTMLMediaElement.playbackRate = playbackSpeed`.

[document.getAnimations()](/en-US/docs/Web/API/Document/getAnimations) là công nghệ thử nghiệm, và bao gồm [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations), [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions), và [Web Animations](/en-US/docs/Web/API/Web_Animations_API). Trang MDN về [Document.getAnimations()](/en-US/docs/Web/API/Document/getAnimations) cung cấp đoạn mã mẫu sau để làm chậm mọi hoạt ảnh trên trang xuống còn một nửa tốc độ:

```js
document.getAnimations().forEach((animation) => {
  animation.playbackRate *= 0.5;
});
```

#### Nguồn ảnh cho hoạt ảnh

Một cách dễ nhất là bắt đầu với một hình ảnh vốn đã tồn tại, dùng nó như nguồn ảnh, rồi làm động nó. Hãy nhớ rằng bạn có thể dùng GIF, JPG, PNG, SVG và các kiểu file khác làm nguồn ảnh ở đây, miễn là chúng là kiểu và kích thước file được phép trong môi trường của bạn. SVG thường không được phép vì lý do bảo mật. Tài liệu MDN [Basic animations](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations) cung cấp nhiều ví dụ xuất sắc về điều này, dùng nhiều nguồn ảnh cho mặt trời, trái đất và mặt trăng, cùng một số phương thức canvas để điều khiển tốc độ và hoạt ảnh của trái đất khi nó quay quanh mặt trời, và của mặt trăng khi nó quay quanh trái đất. Hãy dùng codepen đi kèm tài liệu này để chỉnh `ctx.rotate` trong code và xem hoạt ảnh thay đổi như thế nào.

#### Nếu bạn tuyệt đối phải dùng hoạt ảnh nhấp nháy…

Hãy bảo đảm nó có điều khiển. Hãy bảo đảm nó đang tắt khi người xem gặp lần đầu, và người dùng phải chọn mới thấy được hoạt ảnh.

Một ví dụ về định dạng không có điều khiển cho người dùng là file gif. Tốc độ hoạt ảnh được điều khiển ngay bên trong ảnh gif. Chuyển ảnh gif động sang video sẽ cho phép đặt điều khiển lên hoạt ảnh và trao quyền chủ động cho người dùng. Có rất nhiều bộ chuyển đổi trực tuyến miễn phí, như [EZGif](https://ezgif.com/) và [GIF to MP4](https://gif-2-mp4.com/).

#### Thiết lập kỳ vọng cho người dùng

Hãy cho người dùng biết trước điều gì sẽ xảy ra trước khi họ nhấp vào liên kết đó. Mô tả hoạt ảnh sắp theo sau. Xem [WCAG 2.2 Success Criterion 3.2.5 Change on Request](https://w3c.github.io/wcag/guidelines/22/#change-on-request).

#### Giữ nó nhỏ

Nếu bạn tuyệt đối phải có nhấp nháy, hãy giữ nó nhỏ. Nói chung, giới hạn kích thước nhấp nháy vào vùng khoảng 341 x 256 pixel hoặc nhỏ hơn. Kích thước này giả định người xem ở khoảng cách xem điển hình từ màn hình. Như đã nói trước đó, kích thước này có thể vẫn quá lớn nếu ảnh được xem ở khoảng cách rất gần, như trong kính thực tế ảo. WebVR là một đặc tả mở giúp bạn trải nghiệm VR trong trình duyệt. WebVR có thể dùng trên điện thoại, máy tính hoặc kính đội đầu.

Nếu bạn đang thiết kế cho game hoặc VR dùng mặt nạ mắt, **hoặc CÓ THỂ dùng với mặt nạ mắt**, như trong Firefox Reality (trình duyệt cho thực tế ảo), hãy bảo đảm kích thước hình chữ nhật nhỏ hơn nhiều so với 341 x 256 pixel, vì hình ảnh ở rất gần mắt người dùng.

#### Giảm tương phản

Thông thường, tương phản cao là tốt cho trợ năng. Độ tương phản giữa màu chữ và nền càng cao thì càng dễ đọc (về mặt kỹ thuật gọi là _tỷ lệ tương phản độ chói_, theo trang [Colors with Good Contrast](https://www.w3.org/WAI/perspective-videos/contrast/) của W3.org). Người có thị lực kém đặc biệt đánh giá cao nỗ lực đảm bảo văn bản có tương phản cao so với nền. Tuy nhiên, khi nội dung đang được làm động, **giảm** tương phản thực ra là một cách giảm khả năng nội dung động gây co giật. Hãy hạ tỷ lệ tương phản nếu phát hiện ba nhịp chớp trong vòng một giây.

Tỷ lệ tương phản được định nghĩa trong [WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/) như sau:

- _tỷ lệ tương phản_
  - : (L1 + 0.05) / (L2 + 0.05), trong đó
    - L1 là [độ chói tương đối](https://w3c.github.io/wcag/guidelines/22/#dfn-relative-luminance) của màu sáng hơn, và
    - L2 là [độ chói tương đối](https://w3c.github.io/wcag/guidelines/22/#dfn-relative-luminance) của màu tối hơn.

Tốt nhất là bạn điều chỉnh tương phản trước khi nội dung được tải lên hoặc xuất bản lên web. Với video và GIF động, bộ Adobe Suite là một nguồn lực tuyệt vời cho ảnh truyền thống. Với ảnh, một công cụ trực tuyến khác là [Brightness and contrast online](https://pinetools.com/brightness-contrast-image) của pinetools.com. Nếu bạn định tạo GIF động, hãy bắt đầu với ảnh có tỷ lệ tương phản thấp hơn.

JavaScript cũng là một lựa chọn để giảm tương phản động. Sau đây là ví dụ code từ phần ["Example: Setting the background color of a paragraph"](/en-US/docs/Web/API/Document_Object_Model/Building_and_updating_the_DOM_tree#setting_the_background_color_of_a_paragraph). Lưu ý rằng màu trong ví dụ được mô tả trong không gian màu **RGB**.

**HTML Content [(link to source page)](/en-US/docs/Web/API/Document_Object_Model/Building_and_updating_the_DOM_tree#html_2)**

```html
<body>
  <input type="button" value="Set paragraph background color" />
  <p>hi</p>
  <p>hello</p>
</body>
```

**JavaScript Content [(link to source page)](/en-US/docs/Web/API/Document_Object_Model/Building_and_updating_the_DOM_tree#javascript_2)**

```js
function setBackground() {
  // bây giờ, lấy tất cả phần tử p trong tài liệu
  const paragraphs = document.getElementsByTagName("p");

  // lấy đoạn văn thứ hai từ danh sách
  const secondParagraph = paragraphs[1];

  // đặt style nội tuyến
  secondParagraph.style.background = "red";
}

document.querySelector("input").addEventListener("click", setBackground);
```

#### Tránh màu đỏ bão hòa hoàn toàn cho nội dung nhấp nháy

Như đã đề cập ở trên trong tài liệu này, Epilepsy Foundation of America đã tổ chức một hội thảo vào tháng 8 năm 2004 để bắt đầu xây dựng đồng thuận chuyên gia về co giật nhạy sáng. Một trong các kết quả là nhận thức rằng _"Nhịp chớp là nguy cơ tiềm tàng nếu có độ chói ít nhất 20 cd/m2, xảy ra với tần số ít nhất 3 Hz, và chiếm một góc nhìn đặc rắn ít nhất 0,006 steradian (khoảng 10% trường nhìn trung tâm hoặc 25% diện tích màn hình ở khoảng cách xem điển hình). Chuyển sang hoặc từ màu đỏ bão hòa cũng được xem là rủi ro."_ Họ cũng lưu ý trong đồng thuận đó: _"Bất kể độ chói, chuyển sang hoặc từ màu đỏ bão hòa cũng được xem là rủi ro."_

### Cung cấp kiểu CSS thay thế

Với hiểu biết rằng phần lớn hoạt ảnh và nhấp nháy có thể được điều khiển qua CSS, điều quan trọng là khám phá cách cung cấp các lựa chọn thay thế cho người dùng, và làm cho việc điều khiển các lựa chọn này trở nên thuận tiện và dễ thấy.

#### Bảng kiểu thay thế

Các trình duyệt hiện đại sẽ hiển thị CSS thay thế có sẵn trong các bảng kiểu thay thế nếu người dùng biết tìm ở đâu. Trong một số trường hợp, kiểu thay thế xuất hiện khi người dùng vào menu View, trong trường hợp khác nó nằm trong phần cài đặt, đôi khi cả hai. Không phải người dùng nào cũng biết tìm những tùy chọn này trong trình duyệt hoặc cài đặt, vì vậy nên cân nhắc làm theo cách truyền thống hơn, với các nút hoặc liên kết rõ ràng để thay đổi kiểu để người dùng nhìn thấy. Làm như vậy sẽ không xung đột hay ghi đè khả năng của trình duyệt trong việc đọc bảng kiểu thay thế, hoặc khả năng của người dùng đặt tùy chọn trong cài đặt.

Điều quan trọng là một số người dùng, chẳng hạn những người phụ thuộc vào hệ thống nhận dạng giọng nói, thường dựa vào các nút và liên kết kiểu cũ vì khuyết tật của họ khiến họ không thể dùng chuột, hoặc để tận dụng các sự kiện chạm trên máy tính bảng di động.

Những cách phổ biến để đưa stylesheet thay thế vào tài liệu HTML là dùng phần tử {{HTMLElement('link')}} và {{CSSxref('@import')}}.

#### Phần tử {{HTMLElement('link')}}

Dùng phần tử {{HTMLElement('link')}}, cùng với thuộc tính `rel="alternate stylesheet"` và `title="…"` trong phần {{HTMLElement('head')}} của trang web.

```html
<head>
  <title>Trang chủ</title>
  <link href="main.css" rel="stylesheet" title="Kiểu mặc định" />
  <link
    href="alternate1.css"
    rel="alternate stylesheet"
    title="Kiểu thay thế 1" />
  <link
    href="alternate2.css"
    rel="alternate stylesheet"
    title="Kiểu thay thế 2" />
</head>
```

**{{CSSxref('@import')}}** cũng là một cách đưa stylesheet vào, nhưng không được hỗ trợ tốt bằng phần tử {{HTMLElement('link')}}.

```css
@import "alternate1.css";
@import "alternate2.css";
```

Bằng cách dùng stylesheet thay thế (nhớ thêm tiêu đề), bạn đang thiết lập để người dùng có thể dùng trình duyệt của họ để chọn kiểu thay thế.

### Chuyển đổi kiểu động

Một vấn đề khi dựa vào trình duyệt để hiển thị kiểu thay thế là không phải người dùng nào cũng đủ am hiểu kỹ thuật để tự tìm ra các kiểu thay thế. Hoặc do khuyết tật của họ nên họ không thể làm điều đó. Nút hoặc liên kết sẽ làm rõ rằng có các lựa chọn cho nhiều người dùng. Có rất nhiều cách để thêm nút chuyển đổi cho phép người dùng chuyển sang các stylesheet khác nhau. Dù vậy, dùng stylesheet thay thế không phải là lựa chọn duy nhất. Một lựa chọn khác là thao tác ngay trên kiểu của trang. Theo tài liệu MDN, [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information), _"nếu có thể, thực hành tốt nhất thực sự là thao tác động các class qua thuộc tính [`className`](/en-US/docs/Web/API/Element/className) vì hình thức cuối cùng của tất cả các điểm móc kiểu có thể được điều khiển trong một stylesheet duy nhất"_. Một trong những ví dụ tốt nhất về cách làm này là trang của W3C, ["C29: Using a style switcher to provide a conforming alternate version"](https://www.w3.org/TR/WCAG20-TECHS/C29.html).

### Trường hợp cực đoan: thay thế chỉ văn bản

Một stylesheet thay thế riêng biệt, không hiển thị ảnh, thì khá dễ tạo. Đây là giải pháp rất cứng rắn; nhưng đôi khi cần thiết cho giáo viên và những công chức khác phải phục vụ những người cực kỳ nhạy cảm. Những người này có thể nhờ nhà phát triển tạo một stylesheet thay thế đặc biệt dùng `display: none`. Cách làm bằng CSS:

```css
img {
  display: none;
}
```

#### Tận dụng media queries với {{HTMLElement('style')}}

Khi thiết lập media queries, bạn đang bật các điều khiển do người dùng sử dụng; các điều khiển này có sẵn trong trình duyệt hoặc hệ điều hành. Xem tài liệu MDN [Accessibility: What users can do to browse more safely](/en-US/docs/Web/Accessibility/Guides/Browsing_safely) để biết thêm chi tiết về cách người dùng truy cập các điều khiển này.

#### `prefers-reduced-motion`

Hỗ trợ `prefers-reduced-motion` trong các trình duyệt hiện đại đang ngày càng tăng.

```css
@media screen and (prefers-reduced-motion: reduce) {
}
@media screen and (prefers-reduced-motion) {
}
```

Để xem ví dụ tốt về cách dùng mã `prefers-reduced-motion`, hãy truy cập tài liệu MDN, [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion), hoặc xem ví dụ bên dưới từ phần ["New in Chrome 74"](https://developer.chrome.com/blog/new-in-chrome-74/).

```css
button {
  animation: vibrate 0.3s linear infinite both;
}

@media (prefers-reduced-motion: reduce) {
  button {
    animation: none;
  }
}
```

#### `prefers-color-scheme`

Điều này có thể hữu ích nếu API ánh sáng môi trường không khả dụng. Hỗ trợ đang dần xuất hiện.

```css
@media (prefers-color-scheme: dark) {
  /* điều chỉnh kiểu cho chế độ tối */
}
```

#### Window.matchMedia()

Nhà phát triển có một công cụ mạnh qua Window.matchMedia(). Một tài nguyên tuyệt vời là tài liệu MDN về [`Window.matchMedia()`](/en-US/docs/Web/API/Window/matchMedia).

#### Tính năng cập nhật media

Càng làm mới màn hình thường xuyên, nó càng có vẻ ổn định hơn với mắt người và càng ít "nhấp nháy". Đa số công nghệ hiện đại làm mới ở tần suất không gây vấn đề với nhạy sáng. Tuy nhiên, không phải ai cũng đủ khả năng mua công nghệ mới nhất: máy tính cũ hoặc yếu có thể có tần suất làm mới thấp. [AbilityNet's Factsheet (November 2015) Computers and Epilepsy](https://www.abilitynet.org.uk/sites/abilitynet.org.uk/files/Epilepsy%20and%20Computing%20Nov%202015.pdf) mô tả thêm chi tiết về tần suất làm mới.

Một bài viết khá cũ của Tech Republic, ["Epilepsy and CRT/LCD screen flicker"](https://www.techrepublic.com/forums/discussions/epilepsy-and-crt-lcd-screen-flicker/), có phản hồi thú vị về tần suất làm mới tính bằng Hz:

- _"Hiện tượng này có thể nhận thấy được, và đã được ghi nhận, tới mức 70 Hz."_
- _"Những nghiên cứu này dường như cho thấy bạn nên tránh tần suất dưới 70 Hz, và dùng một tần suất không chia hết cho 10."_

Eric Bailey của CSS-Tricks đã tìm ra một cách dùng sáng tạo tính năng update, khi kết hợp với `animation-duration` hoặc `transition-duration`, để kết thúc ở một tần suất không thể cảm nhận được bằng mắt người. Nói cách khác, kỹ thuật của Eric giải quyết vấn đề tần suất làm mới. CSS dưới đây lấy từ bài CSS-Tricks ["Revisiting prefers-reduced-motion, the reduced motion media query"](https://css-tricks.com/revisiting-prefers-reduced-motion/).

```css
@media screen and (prefers-reduced-motion: reduce), (update: slow) {
  * {
    animation-duration: 0.001ms !important;
    animation-iteration-count: 1 !important; /* Ghi nhận Nick/cssremedy (https://css-tricks.com/revisiting-prefers-reduced-motion/#comment-1700170) */
    transition-duration: 0.001ms !important;
  }
}
```

Tính năng media [`update`](/en-US/docs/Web/CSS/Reference/At-rules/@media/update) được dùng để truy vấn khả năng của thiết bị xuất trong việc thay đổi diện mạo của nội dung sau khi nó đã được dựng. Nó có các giá trị "none", "slow", và "fast".

## Tính năng phát triển & thử nghiệm

### Media Queries Level 5

EnvironmentMQ (dự kiến trong Media Queries Level 5)

- `light-level`
  - : [`light-level`](https://drafts.csswg.org/mediaqueries-5/#light-level) có ba giá trị hợp lệ: dim, normal, và washed. Thú vị là đặc tả không thực sự định nghĩa ba mức này theo phép đo lux, vì thiết bị có cảm biến ánh sáng thường tự điều chỉnh độ sáng màn hình. Đặc tả cũng lưu ý sự khác nhau giữa các công nghệ, như e-ink, vẫn đọc được dưới ánh sáng ban ngày mạnh, so với tinh thể lỏng thì không.
- `environment-blending`
  - : Từ tài liệu nháp của W3C, Media Queries Level 5: _"Tính năng media [`environment-blending`](https://drafts.csswg.org/mediaqueries-5/#descdef-media-environment-blending) được dùng để truy vấn đặc tính của màn hình người dùng để tác giả có thể điều chỉnh kiểu của tài liệu. Tác giả có thể chọn điều chỉnh giao diện và/hoặc bố cục của trang tùy theo công nghệ hiển thị để tăng tính hấp dẫn hoặc cải thiện khả năng đọc."_

#### Các tính năng media theo sở thích người dùng (dự kiến trong Media Queries Level 5)

[User Preference Media Features](https://drafts.csswg.org/mediaqueries-5/#mf-user-preferences) trong [W3C Editor's Draft Media Queries Level 5](https://drafts.csswg.org/mediaqueries-5/) đặc biệt hứa hẹn trong việc trao quyền kiểm soát media cho người dùng. Một số điểm nổi bật:

- `inverted-colors`
  - : Theo phần [User Preference Media Features](https://drafts.csswg.org/mediaqueries-5/#mf-user-preferences), "Tính năng media [`inverted-colors`](https://drafts.csswg.org/mediaqueries-5/#descdef-media-inverted-colors) cho biết nội dung đang được hiển thị bình thường hay màu sắc đã bị đảo ngược."
- [`forced-colors`](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors)
  - : Trong [`forced-colors-mode`](https://drafts.csswg.org/css-color-adjust-1/#forced-colors-mode), user agent áp đặt bảng màu người dùng đã chọn lên trang, ghi đè các màu do tác giả chọn. Từ tài liệu nháp của W3C, phần forced-colors của Media Queries Level 5: _"Tính năng media forced-colors được dùng để phát hiện xem user agent có bật [chế độ màu ép buộc](https://drafts.csswg.org/css-color-adjust-1/#forced-colors-mode) hay không, trong đó nó áp đặt một bảng màu giới hạn do người dùng chọn lên trang"_. Người dùng sẽ cần biết về khả năng này, và nó cần hoạt động tốt với giá trị phù hợp của truy vấn media prefers-color-scheme.
- `light-level`
  - : Từ tài liệu nháp của W3C, phần light-level của Media Queries Level 5: _"Tính năng media [`light-level`](https://drafts.csswg.org/mediaqueries-5/#descdef-media-light-level) được dùng để truy vấn mức ánh sáng môi trường mà thiết bị đang được sử dụng, cho phép tác giả điều chỉnh kiểu tài liệu theo đó."_ Điều này sẽ là một món quà lớn cho những người gặp vấn đề về vận động, hoặc một số người gặp khó khăn nhận thức, những người không thể tìm đúng "nút" để đổi cài đặt màn hình.
- prefers-contrast
  - : Từ tài liệu nháp của W3C, phần [`prefers-contrast`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast): _"Tính năng media `prefers-contrast` được dùng để phát hiện xem người dùng có yêu cầu hệ thống tăng hoặc giảm độ tương phản giữa các màu kề nhau hay không. Ví dụ, nhiều người dùng gặp khó khăn khi đọc văn bản có chênh lệch tương phản nhỏ so với nền văn bản và sẽ thích tương phản lớn hơn."_ Đôi khi cũng có thể có quá nhiều tương phản; trong những tình huống như vậy, hiệu ứng quầng quanh chữ có thể xảy ra và thực sự làm giảm khả năng đọc. Đưa mức tương phản vào quyền kiểm soát của người dùng là một món quà rõ ràng cho trợ năng.

#### Giao diện `MediaQueryList`

Mục 4.2 từ bản nháp CSSWG.org tích hợp với [vòng lặp sự kiện](https://html.spec.whatwg.org/multipage/webappapis.html#event-loop) được định nghĩa trong HTML. [HTML](https://drafts.csswg.org/cssom-view/#biblio-html) cho đối tượng [`MediaQueryList`](https://drafts.csswg.org/cssom-view/#mediaquerylist). Xem tài liệu MDN [MediaQueryList](/en-US/docs/Web/API/MediaQueryList) để biết thêm thông tin.

#### Trợ giúp và hỗ trợ cá nhân hóa

Yêu cầu đối với thuộc tính `literal` được lấy từ [WAI-Adapt: Help and Support](https://w3c.github.io/adapt/help/#literal-explanation).

**Yêu cầu:** Một số người dùng không thể hiểu văn bản và biểu tượng theo nghĩa bóng như ẩn dụ, thành ngữ, v.v. Thuộc tính `literal` nhằm xác định văn bản hoặc hình ảnh là không theo nghĩa đen và cho phép tác giả giải thích các văn bản và hình ảnh này cho người dùng.

## Xem thêm

### MDN

- [Accessibility: What users can do to browse more safely](/en-US/docs/Web/Accessibility/Guides/Browsing_safely)
- [Accessibility: Understanding color and luminance](/en-US/docs/Web/Accessibility/Guides/Colors_and_Luminance)
- [Applying SVG effects to HTML Content](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
- [Basic Animations](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations) (Canvas Tutorial)
- [Canvas API](/en-US/docs/Web/API/Canvas_API)
- [CanvasRenderingContext2D.drawImage()](/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage)
- {{cssxref("&lt;color&gt;")}}
- [Document Object Model](/en-US/docs/Web/API/Document_Object_Model)
- [MediaQueryList](/en-US/docs/Web/API/MediaQueryList)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- [WebGL: 2D and 3D graphics for the web](/en-US/docs/Web/API/WebGL_API)
- [WebVR API](/en-US/docs/Web/API/WebVR_API)

### Màu sắc

- [Color Tutorial: describing color](https://colortutorial.design/) Tom Jewett
- [Formula to Determine Brightness of RGB color](https://stackoverflow.com/questions/596216/formula-to-determine-perceived-brightness-of-rgb-color) Thảo luận Stack Exchange
- [How the Color Red Influences Our Behavior](https://www.scientificamerican.com/article/how-the-color-red-influences-our-behavior/) Scientific American bởi Susana Martinez-Conde, Stephen L. Macknik ngày 1 tháng 11 năm 2014

### Thảo luận

- [Problems with WCAG 2.0 Flash Definition #553](https://github.com/w3c/wcag/issues/553)
- [WCAG 2.1 Understanding 2.3.1 - missing/vague dimension definitions #585](https://github.com/w3c/wcag/issues/585)

### Động kinh và co giật

- [Shedding Light on Photosensitivity, One of Epilepsy's Most Complex Conditions](https://www.epilepsy.com/stories/shedding-light-photosensitivity-one-epilepsys-most-complex-conditions) Epilepsy Foundation: _"Một số cá nhân sinh ra đã có độ nhạy đặc biệt với ánh sáng nhấp nháy hoặc các mẫu trực quan tương phản, như sọc, lưới và bàn cờ. Vì tình trạng này, não của họ sẽ tạo ra các phóng điện kiểu co giật khi tiếp xúc với kiểu kích thích trực quan này."_
- [Gamma oscillations and photosensitive epilepsy](https://www.sciencedirect.com/science/article/pii/S0960982217304062?via%3Dihub) Current Biology [Volume 27, Issue 9](https://www.sciencedirect.com/journal/current-biology/vol/27/issue/9), 8 May 2017, Pages R336-R338: _"Một số [hình ảnh trực quan](https://www.sciencedirect.com/topics/biochemistry-genetics-and-molecular-biology/retina-image), ngay cả khi không có chuyển động hay nhấp nháy, cũng có thể kích hoạt cơn co giật ở người bị động kinh nhạy sáng."_
- [Photosensitive Seizures. Cedars-Sinai](https://www.cedars-sinai.org/health-library/diseases-and-conditions/p/photosensitive-seizures.html) _"Co giật nhạy sáng được kích hoạt bởi ánh sáng nhấp nháy hoặc lóe tắt. Các cơn này cũng có thể bị kích hoạt bởi một số mẫu hình như sọc."_
- [Photic-and pattern-induced seizures: expert consensus of the Epilepsy Foundation of America Working Group](https://pubmed.ncbi.nlm.nih.gov/16146438/) Eplepsia 2005 Sept, 46(9):1423-5 PubMed.gov NCBI [Harding G](https://pubmed.ncbi.nlm.nih.gov/?term=Harding%20G%5BAuthor%5D&cauthor=true&cauthor_uid=16146438), [Wilkins AJ](https://pubmed.ncbi.nlm.nih.gov/?term=Wilkins%20AJ%5BAuthor%5D&cauthor=true&cauthor_uid=16146438), [Erba G](https://pubmed.ncbi.nlm.nih.gov/?term=Erba%20G%5BAuthor%5D&cauthor=true&cauthor_uid=16146438), [Barkley GL](https://pubmed.ncbi.nlm.nih.gov/?term=Barkley%20GL%5BAuthor%5D&cauthor=true&cauthor_uid=16146438), [Fisher RS](https://pubmed.ncbi.nlm.nih.gov/?term=Fisher%20RS%5BAuthor%5D&cauthor=true&cauthor_uid=16146438); [Epilepsy Foundation of America Working Group](https://pubmed.ncbi.nlm.nih.gov/?term=Epilepsy%20Foundation%20of%20America%20Working%20Group%5BCorporate%20Author%5D).

### GPII

- [Accessibility Master List](https://ds.gpii.net/learn/accessibility-masterlist) Gregg Vanderheiden Ph.D. Editor

### ISO

- [IEC 61966-2-2:2003(en)](https://www.iso.org/obp/ui/#iso:std:iec:61966:-2-2:ed-1:v1:en) Hệ thống đa phương tiện và thiết bị - đo và quản lý màu - Phần 2-2: quản lý màu - không gian màu RGB mở rộng - scRGB

### Photosensitive Epilepsy Analysis Tool

Cùng với công cụ Harding, thường được công nhận là một trong hai "chuẩn vàng" để phân tích nhấp nháy.

- [Trace Research and Development Center](https://trace.umd.edu/peat/)
- [Using PEAT To Create Seizureless Web Animations](https://www.useragentman.com/blog/2017/04/02/using-peat-to-create-seizureless-web-animations/)

### W3C

- [WAI-Adapt Explainer](https://w3c.github.io/adapt/)
- [WAI-Adapt: Tools Module](https://www.w3.org/TR/adapt-tools/) Bản nháp làm việc
- [Three Flashes or Below Threshold Understanding SC 2.3.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure-does-not-violate.html) Understanding WCAG 2.0 (bản cũ hơn, nhưng chứa một số giải thích về các tham chiếu được dùng trong tiêu chí WCAG 2.1)
- [Three Flashes or Below Threshold Understanding Success Criterion 2.3.1](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html) Understanding WCAG 2.1
- [Understanding Success Criteria 1.4.3: Contrast (Minimum)](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
- [Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [Web Content Accessibility Guidelines (WCAG) 2.2](https://w3c.github.io/wcag/guidelines/22/#dfn-relative-luminance) định nghĩa độ chói tương đối
