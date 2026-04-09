---
title: Những nguyên tắc cơ bản về hiệu năng
slug: Web/Performance/Guides/Fundamentals
page-type: guide
sidebar: performancesidebar
---

Hiệu năng nghĩa là hiệu quả. Trong ngữ cảnh của Open Web Apps, tài liệu này giải thích một cách tổng quát hiệu năng là gì, nền tảng trình duyệt giúp cải thiện nó như thế nào, và bạn có thể dùng những công cụ và quy trình nào để kiểm tra và cải thiện nó.

## Hiệu năng là gì?

Cuối cùng thì hiệu năng cảm nhận bởi người dùng mới là hiệu năng duy nhất thực sự quan trọng. Người dùng cung cấp đầu vào cho hệ thống thông qua chạm, chuyển động và giọng nói. Đổi lại, họ cảm nhận đầu ra thông qua thị giác, xúc giác và thính giác. Hiệu năng là chất lượng của đầu ra hệ thống khi phản hồi các đầu vào của người dùng.

Khi các yếu tố khác bằng nhau, mã được tối ưu cho một mục tiêu khác ngoài hiệu năng cảm nhận bởi người dùng (sau đây gọi là UPP) sẽ thua khi cạnh tranh với mã được tối ưu cho UPP. Người dùng sẽ thích, chẳng hạn, một ứng dụng phản hồi nhanh và mượt mà chỉ xử lý 1,000 giao dịch cơ sở dữ liệu mỗi giây hơn là một ứng dụng giật, không phản hồi nhưng xử lý 100,000,000 giao dịch mỗi giây. Tất nhiên, việc tối ưu các chỉ số khác không hề vô ích, nhưng các mục tiêu UPP thực sự phải được ưu tiên trước.

Vài mục con tiếp theo sẽ nêu ra và thảo luận các chỉ số hiệu năng thiết yếu.

### Khả năng phản hồi

Khả năng phản hồi nghĩa là hệ thống cung cấp đầu ra nhanh đến mức nào, có thể là nhiều đầu ra, khi phản hồi đầu vào của người dùng. Ví dụ, khi người dùng chạm vào màn hình, họ kỳ vọng các pixel sẽ thay đổi theo một cách nhất định. Với tương tác này, chỉ số khả năng phản hồi là thời gian trôi qua giữa cú chạm và sự thay đổi pixel.

Khả năng phản hồi đôi khi liên quan đến nhiều giai đoạn phản hồi. Khởi chạy ứng dụng là một trường hợp đặc biệt quan trọng sẽ được nói chi tiết hơn bên dưới.

Khả năng phản hồi quan trọng vì con người trở nên bực bội và tức giận khi bị phớt lờ. Ứng dụng của bạn đang phớt lờ người dùng trong mỗi giây nó không phản hồi đầu vào của họ.

### Tần số khung hình

Tần số khung hình là tốc độ mà hệ thống thay đổi các pixel hiển thị cho người dùng. Đây là một khái niệm quen thuộc: ai cũng thích, chẳng hạn, trò chơi hiển thị 60 khung hình mỗi giây hơn là trò chỉ hiển thị 10 khung hình mỗi giây, ngay cả khi họ không thể giải thích vì sao.

Tần số khung hình là một chỉ số "chất lượng dịch vụ" quan trọng. Màn hình máy tính được thiết kế để "đánh lừa" mắt người dùng bằng cách gửi tới họ các photon mô phỏng thực tế. Ví dụ, giấy có in chữ sẽ phản xạ photon vào mắt người dùng theo một mẫu nhất định. Bằng cách thao tác các pixel, một ứng dụng đọc sách phát ra photon theo mẫu tương tự để "đánh lừa" mắt người dùng.

Như não bộ suy luận, chuyển động không phải là giật cục và rời rạc, mà "cập nhật" mượt mà và liên tục. (Đèn strobe thú vị vì chúng đảo ngược điều đó, làm não bộ thiếu đầu vào để tạo ảo giác về một thực tại rời rạc). Trên màn hình máy tính, tần số khung hình cao hơn sẽ tạo ra sự mô phỏng thực tế trung thực hơn.

> [!NOTE]
> Con người thường không thể cảm nhận sự khác biệt về tần số khung hình cao hơn 60Hz. Đó là lý do hầu hết màn hình điện tử hiện đại được thiết kế để làm mới ở tốc độ đó. Ví dụ, một chiếc tivi có lẽ sẽ trông giật và không thực tế đối với chim ruồi.

### Mức sử dụng bộ nhớ

**Mức sử dụng bộ nhớ** là một chỉ số quan trọng khác. Không giống như khả năng phản hồi và tần số khung hình, người dùng không cảm nhận trực tiếp mức sử dụng bộ nhớ, nhưng mức sử dụng bộ nhớ lại gần đúng rất sát với "trạng thái của người dùng". Một hệ thống lý tưởng sẽ duy trì 100% trạng thái người dùng mọi lúc: mọi ứng dụng trong hệ thống sẽ chạy đồng thời, và mọi ứng dụng sẽ giữ lại trạng thái mà người dùng đã tạo ra vào lần cuối người dùng tương tác với ứng dụng đó (trạng thái ứng dụng được lưu trong bộ nhớ máy tính, đó là lý do phép gần đúng này khá sát).

Từ đây có một hệ quả quan trọng nhưng trái trực giác: một hệ thống được thiết kế tốt không tối đa hóa lượng bộ nhớ **trống**. Bộ nhớ là một tài nguyên, và bộ nhớ trống là một tài nguyên chưa được dùng. Thay vào đó, một hệ thống được thiết kế tốt đã được tối ưu để **dùng** càng nhiều bộ nhớ càng tốt nhằm duy trì trạng thái người dùng, đồng thời vẫn đáp ứng các mục tiêu UPP khác.

Điều đó không có nghĩa hệ thống nên **lãng phí** bộ nhớ. Khi một hệ thống dùng nhiều bộ nhớ hơn mức cần thiết để duy trì một trạng thái người dùng cụ thể nào đó, hệ thống đang lãng phí một tài nguyên mà nó có thể dùng để giữ lại trạng thái người dùng khác. Trên thực tế, không hệ thống nào có thể duy trì mọi trạng thái người dùng. Phân bổ bộ nhớ một cách thông minh cho trạng thái người dùng là một mối quan tâm quan trọng mà chúng ta sẽ đi sâu hơn ở phần dưới.

### Mức sử dụng năng lượng

Chỉ số cuối cùng được thảo luận ở đây là **mức sử dụng năng lượng**. Giống như mức sử dụng bộ nhớ, người dùng chỉ cảm nhận mức sử dụng năng lượng gián tiếp, thông qua việc thiết bị của họ có thể duy trì được bao lâu tất cả các mục tiêu UPP khác. Để phục vụ các mục tiêu UPP, hệ thống phải chỉ sử dụng mức năng lượng tối thiểu cần thiết.

Phần còn lại của tài liệu này sẽ thảo luận về hiệu năng theo các chỉ số này.

## Tối ưu hiệu năng của nền tảng

Phần này cung cấp một cái nhìn tổng quan ngắn về cách Firefox/Gecko đóng góp vào hiệu năng nói chung, ở cấp độ thấp hơn mọi ứng dụng. Từ góc nhìn của nhà phát triển hoặc người dùng, phần này trả lời câu hỏi: "Nền tảng làm gì cho bạn?"

### Công nghệ web

Nền tảng Web cung cấp nhiều công cụ, một số phù hợp hơn cho những công việc cụ thể so với những công cụ khác. Toàn bộ logic ứng dụng được viết bằng JavaScript. Để hiển thị đồ họa, nhà phát triển có thể dùng HTML hoặc CSS (tức là các ngôn ngữ khai báo cấp cao), hoặc dùng các giao diện thủ tục cấp thấp do phần tử {{ htmlelement("canvas") }} cung cấp (bao gồm [WebGL](/en-US/docs/Web/API/WebGL_API)). Nằm đâu đó "ở giữa" HTML/CSS và Canvas là [SVG](/en-US/docs/Web/SVG), vốn mang lại một số lợi ích của cả hai.

HTML và CSS làm tăng năng suất rất nhiều, đôi khi phải đánh đổi bằng tần số khung hình hoặc khả năng kiểm soát ở mức pixel đối với việc render. Văn bản và hình ảnh tự động reflow, các phần tử giao diện tự động nhận giao diện hệ thống, và hệ thống cung cấp hỗ trợ "tích hợp sẵn" cho một số trường hợp sử dụng mà nhà phát triển có thể không nghĩ đến ban đầu, như màn hình có độ phân giải khác nhau hoặc ngôn ngữ viết từ phải sang trái.

Phần tử `canvas` cung cấp trực tiếp một vùng đệm pixel để nhà phát triển vẽ lên. Điều này cho nhà phát triển khả năng kiểm soát render ở mức pixel và kiểm soát chính xác tần số khung hình, nhưng giờ đây nhà phát triển cần xử lý nhiều độ phân giải và hướng hiển thị, các ngôn ngữ viết từ phải sang trái, v.v. Nhà phát triển vẽ lên canvas bằng một API vẽ 2D quen thuộc, hoặc WebGL, một liên kết "gần với phần cứng" chủ yếu tuân theo OpenGL ES 2.0.

### Render của Gecko

Công cụ JavaScript của Gecko hỗ trợ biên dịch just-in-time (JIT). Điều này cho phép logic ứng dụng hoạt động tương đương với các máy ảo khác - như máy ảo Java - và trong một số trường hợp thậm chí gần với "mã gốc".

Đường ống đồ họa trong Gecko, nền tảng cho HTML, CSS và Canvas, được tối ưu theo nhiều cách. Mã bố cục HTML/CSS và mã đồ họa trong Gecko giảm việc vô hiệu hóa và vẽ lại cho các trường hợp phổ biến như cuộn; nhà phát triển nhận được hỗ trợ này "miễn phí". Các vùng đệm pixel được Gecko vẽ "tự động" và các ứng dụng vẽ vào `canvas` "thủ công" giảm thiểu việc sao chép khi được đưa lên framebuffer hiển thị. Điều này được thực hiện bằng cách tránh các bề mặt trung gian nơi chúng tạo ra chi phí bổ sung (chẳng hạn như các "back buffer" riêng cho từng ứng dụng trong nhiều hệ điều hành khác), và bằng cách sử dụng bộ nhớ đặc biệt cho các vùng đệm đồ họa có thể được truy cập trực tiếp bởi phần cứng compositor. Các cảnh phức tạp được render bằng GPU của thiết bị để đạt hiệu năng tối đa. Để cải thiện mức sử dụng năng lượng, các cảnh đơn giản được render bằng phần cứng compositing chuyên dụng, trong khi GPU nhàn rỗi hoặc tắt.

Nội dung tĩnh hoàn toàn là ngoại lệ chứ không phải quy luật đối với các ứng dụng giàu tính năng. Các ứng dụng này dùng nội dung động với hiệu ứng {{ cssxref("animation") }} và {{ cssxref("transition") }}. Transitions và animations đặc biệt quan trọng đối với ứng dụng: nhà phát triển có thể dùng CSS để khai báo hành vi phức tạp bằng một cú pháp đơn giản, cấp cao. Đổi lại, đường ống đồ họa của Gecko được tối ưu rất mạnh để render các animation phổ biến một cách hiệu quả. Các animation phổ biến được "chuyển giao" cho system compositor, vốn có thể render chúng theo cách hiệu quả về hiệu năng và năng lượng.

Hiệu năng khởi chạy của một ứng dụng quan trọng không kém hiệu năng lúc chạy. Gecko được tối ưu để tải hiệu quả nhiều loại nội dung: toàn bộ Web! Nhiều năm cải tiến nhắm vào nội dung này, như phân tích HTML song song, lập lịch thông minh cho reflow và giải mã hình ảnh, các thuật toán layout khéo léo, v.v., cũng đem lại lợi ích tương tự cho việc cải thiện ứng dụng Web trong Firefox.

## Hiệu năng ứng dụng

Phần này dành cho các nhà phát triển đang tự hỏi: "Làm sao để làm ứng dụng của tôi nhanh hơn?"

### Hiệu năng khởi chạy

Khởi chạy ứng dụng được đánh dấu bởi ba sự kiện được người dùng cảm nhận, nói chung là:

- Sự kiện đầu tiên là **first paint** của ứng dụng - thời điểm tại đó đã tải đủ tài nguyên ứng dụng để vẽ khung hình ban đầu
- Sự kiện thứ hai là khi ứng dụng trở nên **có thể tương tác** - ví dụ, người dùng có thể chạm vào một nút và ứng dụng phản hồi
- Sự kiện cuối cùng là **full load** - ví dụ khi tất cả album của người dùng đã được liệt kê trong một trình phát nhạc

Chìa khóa để khởi chạy nhanh là ghi nhớ hai điều: UPP là thứ duy nhất quan trọng, và luôn có một "đường dẫn quan trọng" tới từng sự kiện được người dùng cảm nhận ở trên. Đường dẫn quan trọng chính xác chỉ là đoạn mã phải chạy để tạo ra sự kiện đó.

Ví dụ, để vẽ khung hình đầu tiên của một ứng dụng, khung hình đó bao gồm về mặt hình ảnh một ít HTML và CSS để tạo kiểu cho HTML đó:

1. HTML phải được phân tích cú pháp
2. DOM cho HTML đó phải được xây dựng
3. Các tài nguyên như hình ảnh trong phần DOM đó phải được tải và giải mã
4. Các kiểu CSS phải được áp dụng cho DOM đó
5. Tài liệu đã được tạo kiểu phải được reflow

Không có chỗ nào trong danh sách đó là "tải tệp JS cần cho một menu ít khi dùng"; "fetch và giải mã hình ảnh cho danh sách High Scores", v.v. Những công việc đó không nằm trên đường dẫn quan trọng để vẽ khung hình đầu tiên.

Nghe có vẻ hiển nhiên, nhưng để đạt tới một sự kiện khởi chạy do người dùng cảm nhận nhanh hơn, "mẹo" chính là chỉ chạy _mã nằm trên đường dẫn quan trọng_. Rút ngắn đường dẫn quan trọng bằng cách đơn giản hóa cảnh.

Nền tảng Web có tính động rất cao. JavaScript là một ngôn ngữ có kiểu động, và nền tảng Web cho phép tải động mã, HTML, CSS, hình ảnh và các tài nguyên khác. Các tính năng này có thể được dùng để hoãn công việc nằm ngoài đường dẫn quan trọng bằng cách tải "lười" các nội dung không cần thiết sau khi khởi chạy một lúc.

Một vấn đề khác có thể làm chậm khởi chạy là thời gian chờ, do đợi phản hồi từ các yêu cầu (như tải cơ sở dữ liệu). Để tránh vấn đề này, ứng dụng nên phát hành yêu cầu càng sớm càng tốt trong quá trình khởi chạy (điều này gọi là "front-loading"). Sau đó, khi dữ liệu cần ở giai đoạn sau, hy vọng là nó đã sẵn sàng và ứng dụng không phải chờ.

> [!NOTE]
> Để biết thêm nhiều thông tin về cải thiện hiệu năng khởi chạy, hãy đọc [Optimizing startup performance](/en-US/docs/Web/Performance/Guides/Optimizing_startup_performance).

Cùng lưu ý đó, hãy nhớ rằng các tài nguyên tĩnh được lưu vào bộ nhớ đệm cục bộ có thể tải nhanh hơn nhiều so với dữ liệu động được fetch qua mạng di động có độ trễ cao và băng thông thấp. Các yêu cầu mạng không bao giờ nên nằm trên đường dẫn quan trọng của giai đoạn khởi chạy ứng dụng ban đầu. Có thể xây dựng ứng dụng dùng bộ nhớ đệm cục bộ/offline thông qua [Service Workers](/en-US/docs/Web/API/Service_Worker_API). Xem [Offline and background operation](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation) để biết hướng dẫn về cách dùng service workers cho khả năng offline và đồng bộ nền.

### Tần số khung hình

Điều quan trọng đầu tiên để có tần số khung hình cao là chọn đúng công cụ. Dùng HTML và CSS để triển khai nội dung phần lớn là tĩnh, có cuộn và ít khi được hoạt ảnh hóa. Dùng Canvas để triển khai nội dung có tính động cao, như trò chơi cần kiểm soát chặt chẽ việc render và không cần giao diện chủ đề.

Đối với nội dung được vẽ bằng Canvas, việc đạt mục tiêu tần số khung hình là tùy vào nhà phát triển: họ có quyền kiểm soát trực tiếp những gì được vẽ.

Đối với nội dung HTML và CSS, con đường tới tần số khung hình cao là dùng các primitive đúng. Firefox được tối ưu rất mạnh để cuộn nội dung tùy ý; điều này thường không phải là vấn đề. Nhưng nhiều khi đánh đổi một phần tính tổng quát và chất lượng để lấy tốc độ, như dùng render tĩnh thay cho gradient xuyên tâm CSS, có thể đẩy tần số khung hình cuộn vượt mục tiêu. Các [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) CSS cho phép giới hạn những đánh đổi này chỉ vào các thiết bị thực sự cần chúng.

Nhiều ứng dụng dùng transitions hoặc animations qua các "trang", hoặc "panel". Ví dụ, người dùng chạm vào nút "Settings" để chuyển sang màn hình cấu hình ứng dụng, hoặc một menu cài đặt "bật lên". Firefox được tối ưu rất mạnh để chuyển cảnh và hoạt ảnh hóa các cảnh:

- dùng các trang/panel có kích thước xấp xỉ màn hình thiết bị hoặc nhỏ hơn
- chuyển cảnh/hoạt ảnh các thuộc tính CSS `transform` và `opacity`

Các transitions và animations tuân theo những hướng dẫn này có thể được chuyển giao cho system compositor và chạy hiệu quả tối đa.

### Mức sử dụng bộ nhớ và năng lượng

Cải thiện mức sử dụng bộ nhớ và năng lượng là một vấn đề tương tự như tăng tốc khởi chạy: đừng làm việc không cần thiết hoặc tải lười các tài nguyên giao diện hiếm khi được dùng. Hãy dùng các cấu trúc dữ liệu hiệu quả và bảo đảm các tài nguyên như hình ảnh được tối ưu tốt.

CPU hiện đại có thể chuyển sang chế độ tiêu thụ ít điện hơn khi gần như nhàn rỗi. Các ứng dụng liên tục kích hoạt timer hoặc giữ cho các animation không cần thiết chạy sẽ ngăn CPU vào chế độ công suất thấp. Ứng dụng tiết kiệm năng lượng không nên làm vậy.

Khi ứng dụng được đưa xuống nền, một sự kiện {{domxref("document/visibilitychange_event", "visibilitychange")}} sẽ được phát trên tài liệu của chúng. Sự kiện này là bạn tốt của nhà phát triển; ứng dụng nên lắng nghe nó.

### Các mẹo mã hóa cụ thể cho hiệu năng ứng dụng

Những mẹo thực hành sau sẽ giúp cải thiện một hoặc nhiều yếu tố của hiệu năng ứng dụng đã thảo luận ở trên.

#### Dùng CSS animations và transitions

Thay vì dùng hàm `animate()` của một thư viện nào đó, vốn có lẽ hiện đang dùng nhiều công nghệ kém hiệu quả (ví dụ như {{domxref("Window.setTimeout", "setTimeout()")}} hoặc định vị `top`/`left`), hãy dùng [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using). Trong nhiều trường hợp, bạn thực sự có thể dùng [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using) để hoàn thành công việc. Điều này hoạt động tốt vì trình duyệt được thiết kế để tối ưu các hiệu ứng này và dùng GPU để xử lý chúng mượt mà với tác động tối thiểu lên hiệu năng bộ xử lý. Một lợi ích khác là bạn có thể định nghĩa các hiệu ứng này trong CSS cùng với phần còn lại của giao diện ứng dụng, bằng cú pháp chuẩn hóa.

CSS animations cho phép bạn kiểm soát rất chi tiết các hiệu ứng của mình bằng [keyframes](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes), và bạn thậm chí có thể theo dõi các sự kiện được phát trong quá trình animation để xử lý các tác vụ khác cần được thực hiện tại những thời điểm nhất định trong quá trình animation. Bạn có thể dễ dàng kích hoạt các animation này bằng {{cssxref(":hover")}}, {{cssxref(":focus")}} hoặc {{cssxref(":target")}}, hoặc bằng cách thêm và xóa động các class trên phần tử cha.

Nếu bạn muốn tạo animation tức thì hoặc sửa đổi chúng trong [JavaScript](/en-US/docs/Web/JavaScript), James Long đã viết một thư viện đơn giản cho việc đó tên là [CSS-animations.js](https://github.com/jlongster/css-animations.js/).

#### Dùng CSS transforms

Thay vì tinh chỉnh định vị tuyệt đối và tự vật lộn với toàn bộ phép toán đó, hãy dùng thuộc tính CSS {{cssxref("transform")}} để điều chỉnh vị trí, tỷ lệ và các thuộc tính tương tự của nội dung. Ngoài ra, bạn có thể dùng các thuộc tính biến đổi riêng lẻ {{cssxref("translate")}}, {{cssxref("scale")}} và {{cssxref("rotate")}}. Lý do, một lần nữa, là tăng tốc phần cứng. Trình duyệt có thể thực hiện các tác vụ này trên GPU, để CPU xử lý những việc khác.

Ngoài ra, các transform còn mang lại cho bạn những khả năng mà nếu không sẽ không có. Không chỉ có thể dịch chuyển phần tử trong không gian 2D, bạn còn có thể biến đổi trong ba chiều, làm nghiêng và xoay, v.v. Paul Irish đã có một [phân tích chuyên sâu về lợi ích của `translate()`](https://www.paulirish.com/2012/why-moving-elements-with-translate-is-better-than-posabs-topleft/) (2012) xét từ góc nhìn hiệu năng. Tuy nhiên, nói chung, bạn nhận được cùng những lợi ích như khi dùng CSS animations: bạn dùng đúng công cụ cho công việc và để trình tối ưu cho trình duyệt xử lý. Bạn cũng dùng một cách định vị phần tử dễ mở rộng - điều mà cần rất nhiều mã bổ sung nếu bạn giả lập dịch chuyển bằng định vị `top` và `left`. Một lợi ích nữa là điều này rất giống làm việc trong phần tử `canvas`.

> [!NOTE]
> Bạn có thể cần gắn transform `translateZ(0.1)` nếu muốn có tăng tốc phần cứng cho các CSS animations của mình, tùy theo nền tảng. Như đã nói ở trên, điều này có thể cải thiện hiệu năng. Khi lạm dụng, nó có thể gây vấn đề tiêu thụ bộ nhớ. Bạn làm gì trong trường hợp này là tùy bạn - hãy thử nghiệm và tìm ra điều tốt nhất cho ứng dụng cụ thể của mình.

#### Dùng `requestAnimationFrame()` thay vì `setInterval()`

Các lời gọi {{domxref("Window.setInterval", "setInterval()")}} chạy mã theo một tần số khung hình giả định, điều có thể hoặc không thể xảy ra trong hoàn cảnh hiện tại. Nó bảo trình duyệt render kết quả ngay cả khi trình duyệt thực tế chưa vẽ; tức là khi phần cứng video chưa tới chu kỳ hiển thị tiếp theo. Điều này lãng phí thời gian xử lý và thậm chí có thể làm giảm thời lượng pin trên thiết bị của người dùng.

Thay vào đó, bạn nên cố gắng dùng {{domxref("Window.requestAnimationFrame()")}}. Cách này chờ đến khi trình duyệt thực sự sẵn sàng bắt đầu xây dựng khung hình tiếp theo của animation, và sẽ không làm phiền nếu phần cứng sẽ không vẽ gì cả. Một lợi ích khác của API này là các animation sẽ không chạy khi ứng dụng của bạn không hiển thị trên màn hình (chẳng hạn nếu nó ở nền và một tác vụ khác đang hoạt động). Điều này sẽ tiết kiệm pin và ngăn người dùng nguyền rủa tên bạn dưới bầu trời đêm.

#### Làm cho các sự kiện diễn ra tức thì

Là những nhà phát triển Web cũ kỹ, quan tâm đến khả năng truy cập, chúng ta thích các sự kiện click vì chúng cũng hỗ trợ đầu vào từ bàn phím. Trên thiết bị di động, chúng quá chậm. Bạn nên dùng {{domxref("Element/touchstart_event", "touchstart")}} và {{domxref("Element/touchend_event", "touchend")}} thay vào đó. Lý do là chúng không có độ trễ khiến tương tác với ứng dụng trông chậm chạp. Nếu bạn kiểm tra hỗ trợ touch trước, bạn cũng không hy sinh khả năng truy cập. Ví dụ, Financial Times sử dụng một thư viện tên là [fastclick](https://github.com/ftlabs/fastclick) cho mục đích đó, và bạn có thể dùng nó.

#### Giữ giao diện của bạn đơn giản

Một vấn đề hiệu năng lớn mà chúng tôi tìm thấy trong các ứng dụng HTML là việc di chuyển nhiều phần tử [DOM](/en-US/docs/Web/API/Document_Object_Model) khiến mọi thứ trở nên chậm chạp - đặc biệt khi chúng có nhiều gradient và bóng đổ. Điều này được cải thiện nhiều nếu đơn giản hóa giao diện và di chuyển một phần tử đại diện khi kéo thả.

Khi, chẳng hạn, bạn có một danh sách dài các phần tử (giả sử là tweets), đừng di chuyển tất cả chúng. Thay vào đó, hãy giữ trong cây DOM chỉ những phần tử đang hiển thị và vài phần tử ở hai bên của tập tweets đang hiển thị hiện tại. Ẩn hoặc xóa phần còn lại. Giữ dữ liệu trong một đối tượng JavaScript thay vì truy cập DOM có thể cải thiện đáng kể hiệu năng ứng dụng. Hãy coi màn hình là phần trình bày dữ liệu của bạn chứ không phải chính dữ liệu đó. Điều đó không có nghĩa là bạn không thể dùng HTML thuần làm nguồn; chỉ cần đọc nó một lần rồi cuộn 10 phần tử, thay đổi nội dung của phần tử đầu và cuối cho phù hợp với vị trí của bạn trong danh sách kết quả, thay vì di chuyển 100 phần tử không nhìn thấy. Cùng thủ thuật đó cũng áp dụng trong game cho sprite: nếu chúng hiện không ở trên màn hình, không cần phải thăm dò chúng. Thay vào đó, hãy tái sử dụng các phần tử vừa trượt ra ngoài màn hình cho các phần tử mới đi vào.

## Phân tích hiệu năng ứng dụng tổng quát

Firefox, Chrome và các trình duyệt khác đều có công cụ tích hợp sẵn có thể giúp bạn chẩn đoán việc render trang chậm. Cụ thể, [Network Monitor của Firefox](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) sẽ hiển thị một dòng thời gian chính xác về thời điểm từng yêu cầu mạng trên trang của bạn xảy ra, kích thước của nó, và thời gian nó mất để hoàn tất.

![Network monitor của Firefox hiển thị các yêu cầu get, nhiều tệp và các khoảng thời gian khác nhau để tải từng tài nguyên trên một biểu đồ.](network-monitor.jpg)

Nếu trang của bạn chứa mã JavaScript mất nhiều thời gian để chạy, [JavaScript profiler](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html) sẽ xác định chính xác các dòng mã chậm nhất:

![JavaScript profiler của Firefox hiển thị một profile đã hoàn tất 1.](javascript-profiler.png)

[Built-in Gecko Profiler](https://firefox-source-docs.mozilla.org/tools/profiler/index.html) là một công cụ rất hữu ích, cung cấp thông tin chi tiết hơn nữa về những phần nào của mã trình duyệt đang chạy chậm trong khi profiler hoạt động. Cách dùng nó phức tạp hơn một chút, nhưng cung cấp rất nhiều chi tiết hữu ích.

![Một cửa sổ built-in Gecko profiler hiển thị rất nhiều thông tin mạng.](gecko-profiler.png)

> [!NOTE]
> Bạn có thể dùng các công cụ này với trình duyệt Android bằng cách chạy Firefox và bật [about:debugging](https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/index.html).

Đặc biệt, việc tạo hàng chục hay hàng trăm yêu cầu mạng sẽ mất nhiều thời gian hơn trên trình duyệt di động. Việc render hình ảnh lớn và gradient CSS cũng có thể mất nhiều thời gian hơn. Tải các tệp lớn cũng có thể mất nhiều thời gian hơn, ngay cả trên mạng nhanh, vì phần cứng di động đôi khi quá chậm để tận dụng hết băng thông sẵn có. Để có các mẹo tổng quát hữu ích về hiệu năng Web trên di động, hãy xem bài nói chuyện [Mobile Web High Performance](https://www.slideshare.net/firt/mobile-web-high-performance) của Maximiliano Firtman.

### Trường hợp kiểm thử và gửi lỗi

Nếu các công cụ dành cho nhà phát triển của Firefox và Chrome không giúp bạn tìm ra vấn đề, hoặc nếu chúng dường như chỉ ra rằng trình duyệt Web đã gây ra vấn đề, hãy cố gắng cung cấp một test case rút gọn để cô lập tối đa vấn đề. Điều đó thường giúp ích trong việc chẩn đoán sự cố.

Hãy xem liệu bạn có thể tái hiện vấn đề bằng cách lưu và tải một bản sao tĩnh của một trang HTML (bao gồm mọi hình ảnh/style sheet/script mà nó nhúng) hay không. Nếu có, hãy chỉnh sửa các tệp tĩnh để loại bỏ mọi thông tin riêng tư, rồi gửi chúng cho người khác để được trợ giúp (ví dụ, nộp báo cáo [Bugzilla](https://bugzilla.mozilla.org/) hoặc đặt nó trên một máy chủ và chia sẻ URL). Bạn cũng nên chia sẻ mọi thông tin profiling mà bạn đã thu thập bằng các công cụ được liệt kê ở trên.
