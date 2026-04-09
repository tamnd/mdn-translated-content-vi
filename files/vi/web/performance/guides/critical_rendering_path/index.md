---
title: Đường dẫn hiển thị quan trọng
slug: Web/Performance/Guides/Critical_rendering_path
page-type: guide
sidebar: performancesidebar
---

Đường dẫn hiển thị quan trọng là chuỗi các bước mà trình duyệt đi qua để chuyển HTML, CSS và JavaScript thành các pixel trên màn hình. Tối ưu đường dẫn hiển thị quan trọng sẽ cải thiện hiệu năng hiển thị.
Đường dẫn hiển thị quan trọng bao gồm [Document Object Model](/en-US/docs/Web/API/Document_Object_Model) (DOM), [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) (CSSOM), cây kết xuất và bố cục.

Mô hình đối tượng tài liệu được tạo ra khi HTML được phân tích cú pháp. HTML có thể yêu cầu JavaScript, và JavaScript, đến lượt nó, có thể thay đổi DOM. HTML bao gồm hoặc gửi yêu cầu cho các kiểu, từ đó xây dựng mô hình đối tượng CSS. Bộ máy trình duyệt kết hợp hai thứ này để tạo ra cây kết xuất. Bố cục xác định kích thước và vị trí của mọi thứ trên trang. Khi bố cục được xác định xong, các pixel sẽ được vẽ lên màn hình.

Tối ưu đường dẫn hiển thị quan trọng cải thiện thời gian đến lần hiển thị đầu tiên. Hiểu và tối ưu đường dẫn hiển thị quan trọng là điều quan trọng để bảo đảm reflow và repaint có thể xảy ra ở 60 khung hình mỗi giây, để bảo đảm tương tác người dùng hiệu quả, và để tránh [jank](/en-US/docs/Glossary/Jank).

## Hiểu CRP

Hiệu năng web bao gồm các yêu cầu và phản hồi của máy chủ, việc tải, scripting, rendering, bố cục, và việc vẽ các pixel lên màn hình.

Một yêu cầu cho một trang web hoặc ứng dụng bắt đầu bằng một yêu cầu HTTP. Máy chủ gửi một phản hồi chứa HTML. Trình duyệt sau đó bắt đầu phân tích HTML, chuyển các byte nhận được thành cây DOM. Trình duyệt khởi tạo yêu cầu mỗi khi nó tìm thấy liên kết đến tài nguyên bên ngoài, dù là stylesheet, script hay tham chiếu hình ảnh nhúng. Một số yêu cầu là chặn, nghĩa là việc phân tích phần còn lại của HTML sẽ bị dừng cho đến khi tài nguyên được nhập đó được xử lý. Trình duyệt tiếp tục phân tích HTML, tạo yêu cầu và xây dựng DOM, cho đến khi tới cuối tài liệu, tại thời điểm đó nó xây dựng mô hình đối tượng CSS. Khi DOM và CSSOM hoàn tất, trình duyệt xây dựng cây kết xuất, tính toán style cho toàn bộ nội dung nhìn thấy được. Sau khi cây kết xuất hoàn tất, bố cục diễn ra, xác định vị trí và kích thước của tất cả các phần tử trong cây kết xuất. Khi hoàn tất, trang được hiển thị, hoặc "painted", lên màn hình.

### Mô hình đối tượng tài liệu

Việc xây dựng DOM là tăng dần. Phản hồi HTML biến thành các token, rồi thành các node, rồi thành cây DOM. Một node DOM duy nhất bắt đầu bằng token startTag và kết thúc bằng token endTag. Các node chứa toàn bộ thông tin liên quan đến phần tử HTML. Thông tin đó được mô tả bằng token. Các node được nối thành một cây DOM dựa trên thứ bậc token. Nếu một bộ token startTag và endTag khác xuất hiện giữa một bộ startTag và endTag, bạn có một node nằm trong một node, đó là cách chúng ta định nghĩa thứ bậc của cây DOM.

Số lượng node càng nhiều thì các sự kiện sau trong đường dẫn hiển thị quan trọng sẽ càng mất nhiều thời gian. Hãy đo! Một vài node bổ sung sẽ không tạo ra khác biệt lớn, nhưng hãy nhớ rằng thêm nhiều node hơn sẽ ảnh hưởng đến hiệu năng.

### Mô hình đối tượng CSS

DOM chứa toàn bộ nội dung của trang. CSSOM chứa toàn bộ thông tin về cách tạo kiểu cho DOM. CSSOM tương tự DOM, nhưng khác. Trong khi việc xây dựng DOM là tăng dần, CSSOM thì không. CSS là render blocking: trình duyệt chặn việc hiển thị trang cho đến khi nhận và xử lý xong toàn bộ CSS. CSS là render blocking vì các quy tắc có thể bị ghi đè, nên nội dung không thể được hiển thị cho đến khi CSSOM hoàn tất.

CSS có bộ quy tắc riêng để xác định các token hợp lệ. Hãy nhớ rằng chữ C trong CSS là viết tắt của "Cascade". Các quy tắc CSS rơi theo tầng. Khi bộ phân tích cú pháp chuyển token thành node, các node con sẽ kế thừa một số style từ node cha. Các tính năng xử lý tăng dần không áp dụng cho CSS như với HTML, vì các quy tắc sau có thể ghi đè các quy tắc trước. Mô hình đối tượng CSS được xây dựng khi CSS được phân tích cú pháp, nhưng không thể dùng để xây dựng cây kết xuất cho đến khi nó được phân tích xong hoàn toàn vì các style sẽ bị ghi đè bởi quá trình phân tích sau đó không nên được hiển thị lên màn hình.

Về hiệu năng selector, các selector ít cụ thể hơn nhanh hơn các selector cụ thể hơn. Ví dụ, `.foo {}` nhanh hơn `.bar .foo {}` vì khi trình duyệt tìm thấy `.foo`, trong kịch bản thứ hai nó phải đi ngược lên DOM để kiểm tra xem `.foo` có tổ tiên là `.bar` hay không. Thẻ cụ thể hơn đòi hỏi trình duyệt làm nhiều việc hơn, nhưng chi phí này thường không đáng để tối ưu.

Nếu bạn đo thời gian cần để phân tích CSS, bạn sẽ ngạc nhiên vì trình duyệt thực sự nhanh đến mức nào. Quy tắc cụ thể hơn đắt hơn vì nó phải duyệt qua nhiều node hơn trong cây DOM - nhưng chi phí bổ sung đó nhìn chung là rất nhỏ. Hãy đo trước. Tối ưu khi cần. Specificity có lẽ không phải là điểm nghẽn dễ khai thác nhất của bạn. Khi nói đến CSS, các cải thiện tối ưu hiệu năng selector chỉ ở mức micro giây. Có những [cách khác để tối ưu CSS](/en-US/docs/Learn_web_development/Extensions/Performance/CSS), chẳng hạn như minify, và tách CSS hoãn lại thành các yêu cầu không chặn bằng cách dùng media query.

### Cây kết xuất

Cây kết xuất nắm bắt cả nội dung lẫn style: cây DOM và CSSOM được kết hợp thành cây kết xuất. Để xây dựng cây kết xuất, trình duyệt kiểm tra từng node, bắt đầu từ gốc của cây DOM, và xác định quy tắc CSS nào được gắn vào.

Cây kết xuất chỉ nắm bắt nội dung hiển thị. Phần head (thông thường) không chứa thông tin hiển thị nào, vì vậy không được đưa vào cây kết xuất. Nếu một phần tử được đặt `display: none;`, thì chính nó và mọi phần tử con của nó đều không nằm trong cây kết xuất.

### Bố cục

Khi cây kết xuất đã được xây dựng, bố cục trở nên khả thi. Bố cục phụ thuộc vào kích thước màn hình. Bước bố cục xác định các phần tử được đặt ở đâu và như thế nào trên trang, xác định chiều rộng và chiều cao của từng phần tử, và vị trí tương đối của chúng với nhau.

Chiều rộng của một phần tử là bao nhiêu? Theo định nghĩa, các phần tử cấp khối có chiều rộng mặc định bằng 100% chiều rộng của phần tử cha. Một phần tử có chiều rộng 50% sẽ bằng một nửa chiều rộng của phần tử cha. Trừ khi được xác định khác, body có chiều rộng 100%, nghĩa là nó sẽ bằng 100% chiều rộng của viewport. Chiều rộng của thiết bị ảnh hưởng đến bố cục.

Thẻ meta viewport xác định chiều rộng của layout viewport, ảnh hưởng đến bố cục. Nếu không có nó, trình duyệt dùng chiều rộng viewport mặc định, mà trên các trình duyệt toàn màn hình mặc định thì thường là 960px. Trên các trình duyệt toàn màn hình mặc định, như trình duyệt điện thoại của bạn, bằng cách đặt `<meta name="viewport" content="width=device-width">`, chiều rộng sẽ là chiều rộng của thiết bị thay vì chiều rộng viewport mặc định. device-width thay đổi khi người dùng xoay điện thoại giữa chế độ ngang và dọc. Bố cục xảy ra mỗi khi thiết bị được xoay hoặc trình duyệt được thay đổi kích thước theo cách khác.

Hiệu năng bố cục bị ảnh hưởng bởi DOM - số lượng node càng nhiều thì bố cục càng mất thời gian. Bố cục có thể trở thành nút thắt, dẫn đến giật nếu cần trong khi cuộn hoặc hoạt ảnh khác. Mặc dù độ trễ 20ms khi tải hoặc xoay thiết bị có thể chấp nhận được, nó sẽ gây giật khi hoạt ảnh hoặc cuộn. Bất cứ khi nào cây kết xuất bị sửa đổi, chẳng hạn do thêm node, thay đổi nội dung, hoặc cập nhật style mô hình hộp trên một node, bố cục sẽ xảy ra.

Để giảm tần suất và thời lượng của các sự kiện bố cục, hãy gom các bản cập nhật và tránh hoạt ảnh các thuộc tính mô hình hộp.

### Vẽ

Bước cuối cùng là vẽ các pixel lên màn hình. Khi cây kết xuất đã được tạo và bố cục đã diễn ra, các pixel có thể được vẽ lên màn hình. Khi tải, toàn bộ màn hình được vẽ. Sau đó, chỉ những khu vực bị ảnh hưởng của màn hình mới được vẽ lại, vì trình duyệt được tối ưu để vẽ lại vùng nhỏ nhất cần thiết. Thời gian paint phụ thuộc vào loại cập nhật đang được áp dụng cho cây kết xuất. Mặc dù paint là một quá trình rất nhanh, và do đó có lẽ không phải nơi có tác động lớn nhất để tập trung vào khi cải thiện hiệu năng, vẫn quan trọng phải tính đến cả thời gian bố cục và repaint khi đo thời gian một khung hình hoạt ảnh có thể mất bao lâu. Các style áp dụng cho từng node làm tăng thời gian paint, nhưng việc bỏ một style làm tăng paint 0,001ms có thể không mang lại hiệu quả tối ưu lớn nhất. Hãy nhớ đo trước. Sau đó bạn có thể xác định liệu nó có nên là một ưu tiên tối ưu hay không.

## Tối ưu cho CRP

Cải thiện tốc độ tải trang bằng cách ưu tiên tài nguyên nào được tải, kiểm soát thứ tự chúng được tải, và giảm kích thước tệp của các tài nguyên đó. Các mẹo hiệu năng bao gồm 1) giảm số lượng tài nguyên quan trọng bằng cách hoãn tải các tài nguyên không quan trọng, đánh dấu chúng là async, hoặc loại bỏ hoàn toàn, 2) tối ưu số lượng yêu cầu cần thiết cùng với kích thước tệp của mỗi yêu cầu, và 3) tối ưu thứ tự tải các tài nguyên quan trọng bằng cách ưu tiên tải xuống các tài nguyên quan trọng, qua đó rút ngắn độ dài đường dẫn quan trọng.
