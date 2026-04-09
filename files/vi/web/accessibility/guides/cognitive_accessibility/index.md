---
title: Khả năng truy cập nhận thức
slug: Web/Accessibility/Guides/Cognitive_accessibility
page-type: guide
sidebar: accessibilitysidebar
---

Khả năng truy cập nhận thức bao gồm các cân nhắc về khả năng truy cập cho người có rối loạn nhận thức và học tập. Tài liệu này giới thiệu khả năng truy cập nhận thức và cách cải thiện khả năng truy cập của web cho người có khác biệt về nhận thức và học tập.

Suy giảm nhận thức là một thuật ngữ chỉ phạm vi rộng các dạng khuyết tật, từ người có khuyết tật trí tuệ với năng lực có thể bị giới hạn nhiều nhất, đến các vấn đề liên quan đến tuổi tác về suy nghĩ và ghi nhớ. Phạm vi này bao gồm người mắc bệnh tâm thần, chẳng hạn trầm cảm và tâm thần phân liệt. Nó cũng bao gồm người có khuyết tật học tập, chẳng hạn chứng khó đọc và rối loạn tăng động giảm chú ý (ADHD).

Mặc dù có rất nhiều sự đa dạng trong các định nghĩa lâm sàng về suy giảm nhận thức, những người gặp các vấn đề này thường trải qua một bộ vấn đề chức năng chung. Các vấn đề này bao gồm khó hiểu nội dung, khó nhớ cách hoàn thành nhiệm vụ, và sự bối rối do bố cục trang web không nhất quán hoặc không theo kiểu truyền thống. Trong tài liệu này, chúng ta tập trung vào các bước mà nhà phát triển nên thực hiện để cải thiện khả năng truy cập nhận thức cho trang web và ứng dụng của họ.

## Tổng quan

Khuyết tật nhận thức và trí tuệ bao phủ một phổ rất rộng, và có thể là những tình trạng thoáng qua, tạm thời, hoặc vĩnh viễn. Ví dụ, sa sút trí tuệ và Alzheimer là các suy giảm nhận thức vĩnh viễn và sẽ xấu đi dần theo thời gian. Các suy giảm nhận thức vĩnh viễn khác gồm mất ngôn ngữ, ngôn ngữ lời nói, tự kỷ, ADD/ADHD, chứng khó đọc, và chứng khó tính toán.

Một ví dụ về suy giảm nhận thức tạm thời có thể là người bị ảnh hưởng bởi các chất như rượu hoặc ma túy. Một dạng khác có thể là trầm cảm, chẳng hạn khi đang đau buồn vì mất người thân, hoặc vừa buồn bã thoáng qua vì một tweet hay video vừa xem trên mạng. Một ví dụ thứ ba có thể là thiếu ngủ.

Có thể sẽ có vẻ là một thách thức quá lớn khi phải giải quyết phạm vi khác biệt nhận thức rộng như vậy, đặc biệt khi các giải pháp cho hai người khác nhau có thể mâu thuẫn. Một cách để xử lý điều này là tập trung vào các kỹ năng nhận thức. Các kỹ năng nhận thức bao gồm:

- sự chú ý
- trí nhớ
- tốc độ xử lý
- quản lý thời gian
- chữ cái và ngôn ngữ
- ký hiệu số và toán học
- hiểu và đưa ra lựa chọn

Một cách tiếp cận vững chắc để cung cấp giải pháp truy cập cho người có suy giảm nhận thức bao gồm:

- cung cấp nội dung theo nhiều cách, chẳng hạn bằng chuyển văn bản thành giọng nói hoặc bằng video;
- cung cấp nội dung dễ hiểu, chẳng hạn văn bản được viết theo tiêu chuẩn ngôn ngữ đơn giản;
- tập trung sự chú ý vào nội dung quan trọng;
- giảm thiểu sự xao nhãng, chẳng hạn nội dung không cần thiết hoặc quảng cáo;
- cung cấp bố cục và điều hướng trang web nhất quán;
- kết hợp các yếu tố quen thuộc, chẳng hạn liên kết được gạch chân, màu xanh khi chưa truy cập và màu tím khi đã truy cập;
- chia quy trình thành các bước logic, thiết yếu với chỉ báo tiến độ;
- làm cho xác thực trên website càng dễ càng tốt mà không làm giảm bảo mật; và
- làm cho biểu mẫu dễ hoàn thành, chẳng hạn với thông báo lỗi rõ ràng và khả năng khôi phục sau lỗi.

## Hướng dẫn WCAG

WCAG, Web Content Accessibility Guidelines, bao gồm nhiều hướng dẫn nhằm cải thiện khả năng truy cập nhận thức. Những hướng dẫn này được công bố bởi Web Accessibility Initiative (WAI) của World Wide Web Consortium (W3C), tổ chức tiêu chuẩn quốc tế chính cho Internet. Nhóm này cũng chịu trách nhiệm về các hướng dẫn [Accessible Rich Internet Application (ARIA)](/en-US/docs/Web/Accessibility/ARIA/Guides).

WCAG được dẫn dắt bởi bốn nguyên tắc: website phải Có thể nhận biết, Có thể vận hành, Dễ hiểu, và Mạnh mẽ. Để đạt được điều này, chúng xác định 17 hướng dẫn cụ thể, trong đó sáu hướng dẫn đặc biệt liên quan đến khả năng truy cập nhận thức.

Tất cả các hướng dẫn sau đây không chỉ giúp ích cho người có khuyết tật nhận thức. Ví dụ, việc có thể kéo dài thời gian hết hạn trên một ứng dụng yêu cầu mã xác thực được gửi đến thiết bị di động qua tin nhắn văn bản giúp ích cho các tình huống sau:

- Người có rối loạn chú ý hoặc lo âu.
- Người có trí nhớ ngắn hạn kém, hoặc đang làm nhiều việc cùng lúc.
- Người ít am hiểu công nghệ hơn.
- Người có tín hiệu không dây kém.
- Người có vấn đề về kiểm soát vận động.

## Khả năng thích ứng

[Hướng dẫn 1.3](https://www.w3.org/WAI/WCAG21/Understanding/adaptable) nêu rằng "nội dung nên **có khả năng thích ứng**". Hãy tạo nội dung có thể được trình bày theo nhiều cách khác nhau mà không mất thông tin hoặc cấu trúc. Ví dụ, cung cấp bố cục {{glossary('responsive web design', 'responsive')}}, với thiết kế di động một cột.

Tất cả thông tin, bao gồm cấu trúc và các mối quan hệ được truyền đạt thông qua trình bày, nên có sẵn dưới một dạng mà mọi người dùng đều có thể cảm nhận được để đạt mục tiêu này. Ví dụ, thông tin có thể được đọc to thông qua một công cụ thuyết minh. Làm cho nội dung của bạn có thể được phần mềm hiểu là một cách tốt để giúp bảo đảm nó có thể được dùng trong các chế độ trình bày thay thế.

## Thời gian

Điều quan trọng là cho phép người dùng có đủ thời gian họ cần để hoàn thành nhiệm vụ. [Hướng dẫn 2.2](https://www.w3.org/WAI/WCAG21/Understanding/enough-time) nêu rằng hãy "cung cấp cho người dùng đủ **thời gian** để đọc và sử dụng nội dung".

Một **giới hạn thời gian** là bất kỳ quy trình nào diễn ra mà không do người dùng khởi tạo sau một khoảng thời gian định sẵn hoặc theo chu kỳ, chẳng hạn tự đăng xuất sau 30 phút hoặc chỉ có 15 phút để thực hiện một giao dịch mua. Người có khuyết tật nhận thức có thể cần nhiều thời gian hơn để đọc nội dung, hoặc để thực hiện các chức năng như điền biểu mẫu. Các giải pháp bao gồm cung cấp cho người dùng thêm đủ thời gian để hoàn thành tác vụ hoặc loại bỏ hoàn toàn các ràng buộc thời gian.

### Bộ đếm thời gian

Các tùy chọn để điều chỉnh yêu cầu thời gian bao gồm:

- Cho phép người dùng tắt hoặc điều chỉnh thời gian lên tới ít nhất 10 lần giới hạn ban đầu trước khi gặp giới hạn đó.
- Cảnh báo người dùng và cung cấp một khoảng đệm ít nhất 20 giây để kéo dài thời lượng chờ lên gấp 10 lần bằng một hành động, chẳng hạn nhấn phím cách.

Hãy cung cấp một công tắc trên nội dung cho phép người dùng bật giới hạn thời gian phiên dài hơn, hoặc không có giới hạn phiên nào cả. Ví dụ về nội dung có giới hạn thời gian gồm biểu mẫu, bài tập đọc có giới hạn thời gian, và tài liệu đào tạo. Nếu giới hạn thời gian dài hơn 20 giờ, thì không yêu cầu điều chỉnh đặc biệt.

### Di chuyển, nhấp nháy, cuộn

Điều quan trọng là không làm người dùng bị xao nhãng, đặc biệt là những người có khuyết tật nhận thức.

Nếu thông tin di chuyển, nhấp nháy, cuộn, hoặc tự cập nhật bắt đầu tự động, kéo dài hơn năm giây, và được trình bày song song với nội dung khác, người dùng phải có thể tạm dừng, dừng, ẩn hoặc điều khiển nó, trừ khi đó là chức năng thiết yếu. "Thiết yếu" có nghĩa là việc loại bỏ thông tin di chuyển, nhấp nháy, cuộn hoặc tự cập nhật sẽ làm thay đổi căn bản ý nghĩa của nội dung và/hoặc chức năng, **và** thông tin cũng như chức năng đó không thể đạt được theo cách khác phù hợp. Điều này bao gồm các ảnh GIF động, nếu ảnh GIF đó chạy hoạt ảnh hơn 5 giây.

Các tiêu chí thời gian bổ sung cần cân nhắc là:

- Người có giới hạn nhận thức hoặc ngôn ngữ có thể cần nhiều thời gian hơn để đọc và hiểu. Để cải thiện khả năng sử dụng, hãy loại bỏ mọi giới hạn thời gian. Nội dung có giới hạn thời gian cũng nên tránh, ngoại trừ phương tiện đồng bộ không tương tác và các sự kiện thời gian thực.
- Người có rối loạn chú ý nên có thể tập trung vào nội dung mà không bị xao nhãng. Người dùng nên có thể hoãn hoặc chặn các gián đoạn, ngoại trừ những tình huống liên quan đến việc cảnh báo một người về tình huống khẩn cấp. Điều này giúp người có khuyết tật nhận thức tiếp cận được bằng cách cho phép họ tập trung vào mục đích chính của nội dung. Hãy cho phép người dùng hoãn cập nhật nội dung bằng cách cung cấp cách yêu cầu cập nhật thay vì tự động cập nhật. Đồng thời, cho phép các cảnh báo không thiết yếu là tùy chọn.
- Bảo đảm rằng người dùng có thể tiếp tục một hoạt động mà không mất dữ liệu sau khi xác thực lại một phiên đã hết hạn, ví dụ lưu trạng thái của một bảng câu hỏi. Hãy bảo đảm lưu dữ liệu theo cách có thể chỉnh sửa sau khi người dùng xác thực lại. Trước khi xác thực lại, hãy mã hóa dữ liệu dưới dạng ẩn hoặc mã hóa.
- Cung cấp cảnh báo về tình trạng không hoạt động có thể dẫn đến mất dữ liệu. Khi dùng timeout, hãy nói rõ chính xác bao nhiêu thời gian sẽ khiến phiên hết hạn và dẫn đến mất dữ liệu. Ngoại lệ là việc bảo toàn dữ liệu lâu hơn 20 giờ khi không có hành động nào được thực hiện.

## Điều hướng

[Hướng dẫn 2.4](https://www.w3.org/WAI/WCAG21/Understanding/navigable) nêu rằng hãy "cung cấp các cách giúp người dùng điều hướng, tìm nội dung và xác định vị trí của họ", và đưa ra 10 hướng dẫn để bảo đảm site có thể điều hướng và nội dung có thể được tìm thấy:

### Bao gồm `<title>`

Hãy bảo đảm có một {{HTMLElement('title')}} cho tài liệu, vì tiêu đề cung cấp một mô tả nhanh và dễ tham chiếu về điểm chính của màn hình. Người có khuyết tật nhận thức, trí nhớ ngắn hạn hạn chế, và khuyết tật đọc đều được lợi khi có thể xác định mục đích nội dung theo cách này.

### Tiêu đề và nhãn

Hãy bao gồm các tiêu đề rõ ràng và mô tả để người dùng có thể dễ dàng tìm thông tin và hiểu mối quan hệ giữa các phần nội dung khác nhau. Nhãn mô tả giúp người dùng xác định các thành phần cụ thể trong nội dung. Người đọc chậm và người có trí nhớ ngắn hạn hạn chế sẽ được lợi khi tiêu đề phần cho phép dự đoán nội dung của từng phần.

### Tiêu đề phần

Tiêu đề giúp xác định tổ chức tổng thể của nội dung trang. Chúng giúp điều hướng qua các phần nội dung và cung cấp cơ chế hỗ trợ hiểu nội dung. Ví dụ về tiêu đề gồm chương, phần và tiểu mục của nội dung, v.v.

Tiêu đề là các dấu hiệu điều hướng rõ ràng hơn so với các cách khác để xác định các phần nội dung trang (viền, khoảng trắng, đường kẻ ngang, v.v.).

### Nhiều cách để tìm nội dung

Những người dùng khác nhau thích các phương pháp tìm thông tin khác nhau, vì vậy điều quan trọng là phải cung cấp nhiều cách để người dùng tìm nội dung trên site của bạn.

Cung cấp nhiều hơn một cách để điều hướng site có thể giúp người dùng tìm thông tin nhanh hơn. Một số người dùng có thể thích mục lục, sơ đồ site, hoặc chức năng tìm kiếm hơn là đọc và lần theo nhiều trang để tìm thứ họ cần. Những người khác có thể thích khám phá site theo trình tự, di chuyển từ trang này sang trang khác để hiểu tốt nhất bố cục, nội dung, và khái niệm của site.

### Khả năng bỏ qua khối nội dung

Cung cấp cơ chế, chẳng hạn [liên kết bỏ qua](/en-US/docs/Web/HTML/Reference/Elements/a#skip_links), để bỏ qua các khối nội dung được lặp lại trên nhiều trang web.

### Thứ tự focus hợp lý

Thứ tự focus của các phần tử tương tác nên hợp lý. Để đạt được điều này, thứ tự DOM nên khớp với thứ tự trực quan, và thứ tự này lại nên khớp với thứ tự tab. Nếu thứ tự tab nhảy lung tung, đặc biệt theo cách không khớp với thứ tự trực quan khi điều hướng bằng bàn phím, người dùng có thể bị mất phương hướng.

### Các phần tử có focus nên thể hiện rõ là đang được focus

Khi người dùng điều hướng bằng bàn phím, giao diện nên làm rõ phần tử nào hiện đang có focus. Đừng sửa đổi hoặc xóa kiểu mặc định {{cssxref(":focus")}} của trình duyệt, trừ khi bạn đang làm cho focus còn rõ hơn nữa.

### Văn bản liên kết truyền đạt ý nghĩa

Văn bản của liên kết nên truyền đạt rõ ràng và ngắn gọn điều người dùng nên mong đợi sẽ được chuyển tới nếu họ kích hoạt liên kết đó. Văn bản liên kết diễn đạt kém có thể khiến người dùng nhầm lẫn về mục đích hoặc đích đến của nó.

Một số công nghệ hỗ trợ cho phép người dùng điều hướng bằng danh sách tất cả các liên kết trên trang. Các liên kết sẽ bị tách khỏi ngữ cảnh nội dung không phải liên kết xung quanh chúng, khiến nhu cầu về văn bản liên kết dễ hiểu trở nên quan trọng hơn. Một ví dụ tệ là một trang đầy liên kết có văn bản "Nhấn vào đây". Nếu không chỉ ra "đây" sẽ dẫn tới đâu, mục đích của liên kết là không rõ.

Đối với trình đọc màn hình, điều quan trọng là văn bản liên kết phải mô tả mục đích của từng liên kết. Nếu bạn đã thêm nội dung cho liên kết để trình đọc màn hình đọc được, nhưng nội dung đó quá dài dòng và có thể gây nhầm lẫn cho người nhìn thấy, hãy cân nhắc cắt phần nội dung bổ sung đó để ẩn nó với người không dùng công nghệ hỗ trợ.

### Vị trí hiện tại có sẵn

Người dùng nên có thể định hướng trong một site hoặc ứng dụng. Điều này đặc biệt quan trọng và hữu ích đối với những người có khả năng tập trung ngắn, vì họ có thể bị bối rối khi theo một chuỗi bước điều hướng dài.

Tất cả người dùng đều được lợi từ thông tin về vị trí của họ trong hệ thống phân cấp của site, đặc biệt với các site hoặc ứng dụng có nhiều nội dung hoặc nhiều tiểu mục. [Breadcrumb](/en-US/docs/Glossary/Breadcrumb), [sơ đồ site](/en-US/docs/Glossary/Site_map), và việc đánh dấu trang hiện tại trong điều hướng là "current" đều là những kỹ thuật giúp truyền đạt vị trí hiện tại.

## Dễ đọc

[Hướng dẫn 3.1](https://www.w3.org/WAI/WCAG21/Understanding/readable) nêu rằng hãy "làm cho nội dung văn bản dễ đọc và dễ hiểu". Với một số người dùng, việc suy ra nghĩa của một từ hoặc cụm từ từ ngữ cảnh là khó, đặc biệt khi từ hoặc cụm từ đó được dùng theo cách bất thường, hoặc mang nghĩa chuyên biệt.

Đối với những người dùng này, khả năng đọc và hiểu có thể phụ thuộc vào việc có sẵn các định nghĩa cụ thể hoặc dạng đầy đủ của từ viết tắt hay chữ tắt. Một số người dùng có thể rất khó nhận ra các từ viết ra, nhưng họ lại hiểu được các tài liệu rất phức tạp và tinh vi khi văn bản được đọc to, hoặc khi các quy trình và ý tưởng chính được minh họa bằng hình ảnh.

### Khai báo ngôn ngữ của trang và mọi nội dung không cùng ngôn ngữ chính

Ngôn ngữ của mọi trang phải được khai báo bằng thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) trên phần tử {{HTMLElement('html')}}. Hãy thêm lại thuộc tính `lang` cho văn bản được viết bằng ngôn ngữ khác với ngôn ngữ chính của tài liệu.

Việc dùng đúng `lang` cho phép một số trình đọc màn hình đọc văn bản chính xác hơn khi chuyển sang giọng nói tổng hợp. Nó cũng giúp những người dùng phần mềm chuyển văn bản thành giọng nói.

### Định nghĩa các từ và cách dùng từ bất thường

Một số dạng khuyết tật khiến việc hiểu cách dùng từ không theo nghĩa đen, như thành ngữ, khẩu ngữ, và thuật ngữ chuyên ngành, trở nên khó khăn. Người không phải bản ngữ cũng có thể gặp khó với những thuật ngữ này. Nếu một từ hoặc cụm từ có nghĩa riêng, hãy cung cấp định nghĩa ngay trong tài liệu, hoặc liên kết tới một mục chú giải, hoặc tới từ điển trực tuyến. Nếu một từ hoặc cụm từ được dùng với nhiều hơn một nghĩa, hãy định nghĩa từng cách dùng.

### Định nghĩa chữ viết tắt

Chữ viết tắt có thể gây nhầm lẫn cho những người:

- Khó giải mã từ.
- Có trí nhớ hạn chế.
- Khó dùng ngữ cảnh để hỗ trợ hiểu.
- Phụ thuộc vào kính lúp màn hình (thường làm giảm manh mối ngữ cảnh).

Hãy cung cấp dạng đầy đủ của chữ viết tắt ngay lần đầu nó xuất hiện, sau đó đặt chữ viết tắt trong phần tử {{HTMLElement('abbr')}}. Nếu một chữ viết tắt không có dạng đầy đủ, hoặc là viết tắt của một từ không nằm trong ngôn ngữ chính của tài liệu (chẳng hạn tiếng Latinh), hãy giải thích ý nghĩa của nó. Đồng thời, hãy cân nhắc dùng [ruby text](/en-US/docs/Web/HTML/Reference/Elements/ruby) cho initialism (cách đọc tắt của các acronym).

### Trình độ đọc

Nội dung nên được viết rõ ràng nhất có thể. Một nguyên tắc tốt là làm cho nội dung đủ đơn giản để có thể hiểu ngay lần đầu. Các cách đạt được điều này gồm:

- Dùng từ ngắn, đơn giản.
- Viết câu ngắn.
- Viết ở thể chủ động, thì hiện tại.
- Dùng ngữ pháp và chính tả đúng.

Việc cung cấp một bản tóm tắt văn bản (đôi khi gọi là TL;DR, hoặc "too long; didn't read") ở mức đọc thấp giúp người có khuyết tật nhận thức. Một kỹ thuật khác là cung cấp hình ảnh đi kèm để giúp giải thích ý tưởng, sự kiện, và quy trình.

Có những công cụ có thể chấm mức độ của nội dung. Ví dụ, tài liệu này có mức lớp trung bình khoảng 11. Điều này có nghĩa là một người bản ngữ tiếng Anh 16 đến 17 tuổi có thể hiểu được dễ dàng. Một số công cụ thậm chí còn có thể đưa ra gợi ý giúp đơn giản hóa nội dung.

### Phát âm

Có nhiều kỹ thuật có thể giúp dạy người khác cách phát âm từ:

- Cung cấp cách phát âm ngay sau từ.
- Liên kết tới danh sách phát âm.
- Cung cấp chú giải với phát âm.
- Dùng phần tử {{HTMLElement('ruby')}} để minh họa cách phát âm một từ.

Việc cung cấp hướng dẫn phát âm giúp ích cho nhiều kiểu người dùng khác nhau, bao gồm những người thích đọc to, người không phải bản ngữ, và những người không quen với nghĩa của một thuật ngữ trong ngữ cảnh.

Một giải pháp khác là dùng glyph hoặc dấu phụ để minh họa phát âm. Tuy nhiên, nếu dùng kỹ thuật này, phải có cơ chế để tắt nó đi. Hơn nữa, việc liên kết tới hướng dẫn về các dấu đang dùng sẽ hữu ích, vì ý nghĩa của chúng có thể không hiển nhiên.

## Khả năng dự đoán

WCAG [Hướng dẫn 3.2](https://www.w3.org/WAI/WCAG21/Understanding/predictable) nêu rằng hãy "làm cho các trang web xuất hiện và hoạt động theo cách có thể dự đoán". Đây là một nguyên tắc của thiết kế trải nghiệm người dùng tốt. Tính nhất quán đặc biệt quan trọng đối với người có khó khăn về nhận thức. Điều này bao gồm sự nhất quán trong bố cục trang và các thành phần tương tác có thể dự đoán.

### Dùng kích hoạt, không dùng focus để thay đổi ngữ cảnh

Việc tạo ra thay đổi ngữ cảnh phải có chủ đích. Vì vậy, khi một tính năng giao diện người dùng nhận [focus](/en-US/docs/Web/API/HTMLElement/focus), nó không nên kích hoạt các hành động tiếp theo hướng tới người dùng. Thay vào đó, người dùng nên cần "kích hoạt" tính năng đó để gây ra thay đổi.

### Thay đổi cài đặt dựa trên một yêu cầu chủ động

Việc vận hành điều khiển biểu mẫu và nhập dữ liệu nên cho hành vi có thể dự đoán. Thay đổi ngữ cảnh có thể làm người dùng có khuyết tật nhận thức bối rối, vì vậy chỉ nên xảy ra khi rõ ràng rằng thay đổi đó sẽ diễn ra do hành động của người dùng.

Thay đổi trạng thái nên đòi hỏi hành động có chủ đích của người dùng. Ví dụ như đánh dấu một checkbox, nhập dữ liệu hoặc đổi một tùy chọn select. Đồng thời hãy chắc chắn cung cấp nút gửi để khởi tạo thay đổi ngữ cảnh, và mô tả trước điều gì sẽ xảy ra trước khi thay đổi được thực hiện.

### Giữ điều hướng nhất quán trong toàn site

Giữ thứ tự điều hướng nhất quán giữa các trang. Ví dụ, nếu bạn có một thanh điều hướng trên nhiều trang, hãy làm cho thanh điều hướng đó đồng nhất trên toàn site với cùng các liên kết ở cùng một vị trí. Điều này không chỉ áp dụng cho điều hướng: hãy trình bày tất cả các thành phần lặp lại theo cùng thứ tự tương đối mỗi khi chúng xuất hiện.

### Cung cấp nhãn nhất quán

Các chức năng giống hệt nhau nên có nhãn tương tự mỗi khi chúng được dùng. Nhãn nút nhất quán, văn bản thay thế cho biểu tượng, và biểu tượng cho các tương tác tương tự, v.v., ngay cả ở các phần khác nhau của site, đều giúp tất cả người dùng của bạn.

### Nhất quán, có thể dự đoán, và theo chuẩn

Mặc dù biểu tượng không có nhãn không phải là cách hiệu quả nhất để truyền đạt thông tin, việc giữ cho cách dùng biểu tượng (và nếu có nhãn, thì cả văn bản nhãn) nhất quán sẽ giúp người dùng hiểu biểu tượng đó đại diện cho gì. Tương tự, đừng thay đổi các mặc định như nút quay lại của trình duyệt. Nếu bạn cần chuyển hướng người dùng, hãy báo cho người dùng biết trước.

## Hỗ trợ nhập liệu

[Hướng dẫn 3.3](https://www.w3.org/WAI/WCAG21/Understanding/input-assistance) giúp bảo đảm việc nhập dữ liệu chính xác, nêu rằng hãy "giúp người dùng tránh và sửa lỗi". Mọi người đều mắc lỗi, nhưng một số người dễ mắc lỗi hơn, ít có khả năng nhận ra lỗi hơn, hoặc gặp khó khăn hơn khi sửa lỗi sau khi mắc.

Các hướng dẫn về hỗ trợ nhập liệu nhằm giảm khả năng người dùng, đặc biệt là người có khuyết tật, mắc lỗi, và nếu họ có mắc lỗi thì tăng khả năng họ nhìn thấy và hiểu thông báo lỗi và có thể sửa lỗi thành công.

### Truyền đạt việc phát hiện lỗi tự động

Người dùng cần được cảnh báo về lỗi và được thông báo lỗi gì đang xảy ra. Nếu có phát hiện lỗi phía máy khách, hãy tuân thủ các hướng dẫn sau để thông báo lỗi hiệu quả nhất có thể:

- Lỗi phải được mô tả bằng văn bản.
- Bảo đảm thông báo lỗi càng cụ thể càng tốt.
- Cung cấp văn bản để nhận diện các trường bắt buộc chưa hoàn thành và mô tả văn bản nếu giá trị nhập vào không hợp lệ.
- Nếu lỗi ngăn việc gửi biểu mẫu, hãy tập trung vào lỗi. Nếu có nhiều lỗi, hãy cung cấp một bản tóm tắt, trong đó mỗi lỗi liên kết tới input liên quan.
- Bao gồm văn bản bên cạnh việc dùng biểu tượng, hình ảnh, màu sắc, v.v. Một số người gặp khó khăn trong việc hiểu ý nghĩa của biểu tượng và các tín hiệu trực quan khác.
- Những người khác có thể gặp khó khăn trong việc hiểu phiên bản văn bản của thông báo lỗi. Với những người này, hãy cung cấp thêm biểu tượng và màu sắc.
- Đồng thời, hãy cung cấp phản hồi khi gửi biểu mẫu thành công.

### Cung cấp hướng dẫn cho dữ liệu nhập của người dùng

Bắt đầu biểu mẫu bằng các hướng dẫn văn bản về cách vận hành nó. Bao gồm nhãn hoặc hướng dẫn khi người dùng cần nhập thông tin, bằng cách dùng các phần tử {{HTMLElement('label')}}, {{HTMLElement('fieldset')}}, và {{HTMLElement('legend')}}.

Nhãn nên mô tả rõ và được đặt gần input mà chúng liên quan. Khi yêu cầu một định dạng cụ thể cho dữ liệu nhập, hãy cung cấp một ví dụ đúng định dạng. Ngoài ra, hãy cân nhắc kiểm tra phía máy chủ để giúp định dạng dữ liệu đầu vào, nhằm hỗ trợ việc nhập liệu dễ dàng hơn.

Nếu một điều khiển biểu mẫu là bắt buộc, hãy chỉ ra điều đó cả về mặt trực quan và [qua mã](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required). Nếu một điều khiển biểu mẫu làm thay đổi ngữ cảnh, hãy mô tả điều gì sẽ xảy ra theo cách mà người dùng có thể hiểu trước khi họ tạo ra thay đổi ngữ cảnh đó.

### Gợi ý lỗi

Hãy cung cấp đề xuất nhập liệu cho người dùng nếu một lỗi nhập liệu được phát hiện tự động và các gợi ý sửa đã biết (trừ khi điều đó có thể làm tổn hại đến bảo mật hoặc mục đích của nội dung).

### Ngăn chặn thảm họa

Đối với các lần gửi có thể gây ra, hoặc dẫn đến, hậu quả pháp lý, tài chính, hoặc các hậu quả đáng kể khác, hãy bảo đảm rằng các lần gửi đó có thể được xem xét, xác nhận và/hoặc đảo ngược.

Dữ liệu do người dùng nhập nên được kiểm tra lỗi trước khi gửi, và người dùng nên có cơ hội sửa lỗi. Người dùng nên có thể xem lại, xác nhận, và chỉnh sửa thông tin trước khi gửi cuối cùng. Đồng thời, hãy chắc chắn bao gồm một hộp kiểm xác nhận bên cạnh nút gửi.

Nếu việc gửi gây ra một giao dịch pháp lý hoặc tài chính, hãy cung cấp một khoảng thời gian đã nêu rõ trong đó người dùng có thể sửa đổi hoặc hủy yêu cầu.

### Cung cấp trợ giúp

Nên cung cấp trợ giúp theo ngữ cảnh. Nếu biểu mẫu yêu cầu nhập văn bản, hãy cung cấp hướng dẫn biểu mẫu mô tả mục đích và dữ liệu cần nhập. Bao gồm kiểm tra chính tả và gợi ý cho dữ liệu văn bản dài, cũng như liên kết tới tài liệu trợ giúp và hỗ trợ. Nếu kỳ vọng một định dạng dữ liệu cụ thể, hãy cung cấp ví dụ.

## Ghi chú

Những phương pháp trên là các thực hành thiết kế tốt. Chúng sẽ có lợi cho mọi người.

- Nhiều người có khuyết tật nhận thức cũng có khuyết tật thể chất. Website phải tuân thủ [Web Content Accessibility Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/) của W3C.
- [Cognitive and Learning Disabilities Accessibility Task Force](https://www.w3.org/WAI/GL/task-forces/coga/) của W3C tạo ra các hướng dẫn khả năng truy cập web cho người có suy giảm nhận thức.
- WebAIM có một [trang Cognitive](https://webaim.org/articles/cognitive/) chứa thông tin và tài nguyên liên quan.
- Trung tâm Kiểm soát Dịch bệnh Hoa Kỳ ước tính rằng, tính đến năm 2018, cứ 4 công dân Mỹ thì có 1 người có khuyết tật, và [suy giảm nhận thức là phổ biến nhất ở người trẻ](https://archive.cdc.gov/www_cdc_gov/media/releases/2018/p0816-disability.html).
- Ở Mỹ, "intellectual disabilities" trước đây được gọi là "mental retardation". Ở Anh, "intellectual disabilities" thường được gọi là "learning disabilities" hoặc "learning difficulties".

## Xem thêm

- [Accessibility Guidelines](https://extensionworkshop.com/documentation/develop/build-an-accessible-extension/)
- [What is accessibility](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility)
- [Accessibility for seizure disorders](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)
- [Understanding WCAG Guidelines](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG)
- [Accessibility overview](/en-US/docs/Learn_web_development/Core/Accessibility)
- [Web Content Accessibility Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/), bao gồm [các hướng dẫn về khả năng truy cập nhận thức](#wcag_guidelines)
- [Cognitive and Learning Disabilities Accessibility Task Force của W3C](https://www.w3.org/WAI/GL/task-forces/coga/)
- [WebAIM Cognitive information](https://webaim.org/articles/cognitive/)
- [CDC information on disabilities](https://www.cdc.gov/disability-and-health/)
