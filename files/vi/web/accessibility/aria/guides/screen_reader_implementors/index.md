---
title: Hướng dẫn cho người triển khai trình đọc màn hình ARIA
short-title: Hướng dẫn cho người triển khai trình đọc màn hình
slug: Web/Accessibility/ARIA/Guides/Screen_Reader_Implementors
page-type: guide
sidebar: accessibilitysidebar
---

## Live Regions

Đây chỉ là một tài liệu hướng dẫn. Markup live region là một lĩnh vực phức tạp và phần nào còn để ngỏ cho việc diễn giải. Nội dung sau đây nhằm cung cấp hướng dẫn triển khai, đồng thời tôn trọng nhu cầu của các nhà phát triển trình đọc màn hình trong việc thử nghiệm những cách tiếp cận khác nhau. Mục tiêu là cân bằng giữa việc đưa ra hướng dẫn hữu ích về cách dùng ý nghĩa dự định của markup và việc hỗ trợ live region như một lĩnh vực để các trình đọc màn hình đổi mới và cạnh tranh.

### Diễn giải markup live region của WAI-ARIA

1. Các thay đổi live là gợi ý: nói chung, markup live region được tác giả cung cấp như các gợi ý, và công nghệ hỗ trợ có thể cho phép các thiết lập toàn cục, theo từng site hoặc thậm chí theo từng vùng, cũng như các heuristic để hỗ trợ xử lý các thay đổi live trên những trang không có gợi ý WAI-ARIA.
2. Tùy chọn tạo hàng đợi thứ hai nếu người dùng cấu hình kênh phần cứng thứ hai: Nếu có hai kênh trình bày, chẳng hạn văn bản thành giọng nói và màn hình chữ nổi Braille, thì có thể duy trì hai hàng đợi để cho phép trình bày song song. Người dùng có thể cấu hình các kênh này để trình bày live region dựa trên vai trò hoặc mức độ lịch sự.
3. Vùng bận: Bất kỳ thay đổi nào trong một vùng được đánh dấu `aria-busy="true"` không nên được thêm vào hàng đợi cho đến khi thuộc tính đó được xóa.
4. Mức độ lịch sự (`aria-live` hoặc từ [role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)) được ưu tiên đầu tiên: các mục nên được thêm vào hàng đợi dựa trên mức độ lịch sự của chúng từ thuộc tính `aria-live` hoặc được kế thừa từ `role` (ví dụ [role="log"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role) mặc định là polite). Các mục assertive đứng trước, sau đó là mức độ lịch sự. Ngoài ra, triển khai có thể chọn chính sách loại bỏ các mục lịch sự hơn, ví dụ các mục assertive sẽ xóa mọi mục polite khỏi hàng đợi.
5. Thời gian được ưu tiên thứ hai: Ưu tiên các mục có cùng mức độ lịch sự theo thời điểm sự kiện xảy ra, sự kiện sớm hơn đứng trước. Trình bày các mục có cùng mức độ lịch sự theo thứ tự xảy ra trước sau.
6. Các vùng atomic (`aria-atomic="true"`) có nhiều thay đổi không nên được trình bày hai lần với cùng nội dung. Khi một sự kiện mới cho vùng atomic được thêm vào hàng đợi, hãy xóa sự kiện trước đó của cùng vùng. Có lẽ nên có ít nhất một khoảng trễ nhỏ trước khi trình bày các thay đổi của vùng atomic để tránh trình bày vùng đó hai lần khi hai thay đổi xảy ra rất sát nhau.
7. Bao gồm nhãn khi trình bày thay đổi: nếu thay đổi xảy ra trong một thứ có nhãn ngữ nghĩa nào đó, hãy đọc nhãn đó. Điều này đặc biệt quan trọng với thay đổi trong các ô dữ liệu, nơi tiêu đề cột và hàng cung cấp thông tin ngữ cảnh quan trọng.

### Gợi ý về thiết lập và heuristic

1. Cho phép dùng giọng đọc khác trong hệ thống text-to-speech hoặc các đặc điểm trình bày khác để phân biệt các thay đổi live.
2. Khi không có markup WAI-ARIA, tự động trình bày một số thay đổi trừ khi người dùng cấu hình tắt toàn bộ thay đổi live. Ví dụ, tự động đọc những thay đổi do chính đầu vào của người dùng gây ra, như một phần trong ngữ cảnh của đầu vào đó.
3. Cho phép các thiết lập toàn cục để tắt việc trình bày thay đổi live, trình bày tất cả thay đổi live, dùng markup, hoặc ở chế độ "thông minh" (dùng heuristic).
