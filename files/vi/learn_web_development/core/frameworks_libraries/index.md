---
title: Các framework và thư viện JavaScript
slug: Learn_web_development/Core/Frameworks_libraries
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Introduction", "Learn_web_development/Core")}}

Các framework JavaScript là một phần thiết yếu trong phát triển web front-end hiện đại, cung cấp cho các nhà phát triển những công cụ đã được kiểm chứng để xây dựng các ứng dụng web có thể mở rộng và tương tác. Nhiều công ty hiện đại sử dụng framework như một phần tiêu chuẩn trong bộ công cụ của họ, vì vậy nhiều công việc phát triển front-end hiện nay yêu cầu kinh nghiệm về framework. Bộ bài viết này cung cấp một điểm khởi đầu thuận tiện để giúp bạn bắt đầu học framework.

Là một nhà phát triển front-end đầy tham vọng, việc xác định nên bắt đầu từ đâu khi học framework có thể khó khăn — có rất nhiều framework để lựa chọn, các framework mới xuất hiện liên tục, chúng hầu hết hoạt động theo cách tương tự nhau nhưng làm một số thứ khác nhau, và có một số điều cụ thể cần lưu ý khi sử dụng framework.

Chúng tôi không nhằm mục đích dạy đầy đủ tất cả những gì bạn cần biết về React/ReactDOM, Vue, hay một framework cụ thể nào khác; tài liệu của nhóm phát triển framework (và các tài nguyên khác) đã làm điều đó rồi. Thay vào đó, chúng tôi muốn lùi lại và trả lời các câu hỏi cơ bản hơn như:

- Tại sao tôi nên sử dụng framework? Chúng giải quyết vấn đề gì cho tôi?
- Những câu hỏi nào tôi nên đặt ra khi cố gắng chọn một framework? Tôi có thực sự cần sử dụng framework không?
- Các framework có những tính năng gì? Chúng hoạt động như thế nào nói chung, và cách các framework triển khai những tính năng này khác nhau như thế nào?
- Chúng liên quan như thế nào đến JavaScript hoặc HTML "thuần túy"?

Sau đó, chúng tôi sẽ cung cấp một số hướng dẫn bao gồm những điều cơ bản về React, một lựa chọn framework phổ biến, để cung cấp cho bạn đủ bối cảnh và sự quen thuộc để bắt đầu đào sâu hơn. Chúng tôi muốn bạn tiến lên và học về framework theo cách thực dụng mà không quên những thực tiễn tốt nhất về nền tảng web cơ bản như khả năng tiếp cận.

Chúng tôi cũng cung cấp một số hướng dẫn bao gồm những kiến thức cơ bản về các lựa chọn framework khác, dành cho những ai muốn lựa chọn khác với React.

> [!NOTE]
> Hướng dẫn tương tác [Libraries/Frameworks](https://scrimba.com/learn-react-c0e/~033a?via=mdn) của Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp một tóm tắt hữu ích về framework so với thư viện, một lịch sử ngắn gọn về các thư viện và framework trên web, và một số thông tin nền về React.

## Điều kiện tiên quyết

Bạn thực sự nên học những kiến thức cơ bản về các ngôn ngữ web cốt lõi trước khi cố gắng chuyển sang học các framework phía client — [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và đặc biệt là [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting).

Code của bạn sẽ phong phú và chuyên nghiệp hơn, và bạn sẽ có thể khắc phục sự cố một cách tự tin hơn nếu bạn hiểu các tính năng nền tảng web cơ bản mà các framework đang xây dựng dựa trên đó.

## Các hướng dẫn giới thiệu

- [Giới thiệu về framework phía client](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Introduction)
  - : Chúng tôi bắt đầu tìm hiểu về framework với một cái nhìn tổng quan chung về lĩnh vực này, xem xét lịch sử ngắn gọn về JavaScript và framework, tại sao framework tồn tại và chúng mang lại cho chúng ta điều gì, cách bắt đầu suy nghĩ về việc chọn framework để học, và những giải pháp thay thế nào tồn tại cho framework phía client.
- [Các tính năng chính của framework](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Main_features)
  - : Mỗi framework JavaScript lớn có cách tiếp cận khác nhau để cập nhật DOM, xử lý sự kiện trình duyệt và cung cấp trải nghiệm nhà phát triển dễ chịu. Bài viết này sẽ khám phá các tính năng chính của "bốn ông lớn" framework, xem xét cách framework thường hoạt động ở cấp độ cao và sự khác biệt giữa chúng.

## Các hướng dẫn React

> [!NOTE]
> Các hướng dẫn React được kiểm tra lần cuối vào tháng 1 năm 2023, với React/ReactDOM 18.2.0 và create-react-app 5.0.1.
>
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm phiên bản hoàn chỉnh của code ứng dụng React mẫu trong [kho lưu trữ todo-react](https://github.com/mdn/todo-react) của chúng tôi. Để xem phiên bản chạy trực tiếp, hãy xem <https://mdn.github.io/todo-react/>.

- [Bắt đầu với React](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_getting_started)
  - : Trong bài viết này, chúng tôi sẽ chào đón React. Chúng tôi sẽ khám phá một chút chi tiết về lịch sử và các trường hợp sử dụng của nó, thiết lập một chuỗi công cụ React cơ bản trên máy tính cục bộ của chúng tôi, và tạo và thử nghiệm với một ứng dụng khởi động đơn giản, học một chút về cách React hoạt động trong quá trình đó.
- [Bắt đầu ứng dụng ToDo React của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning)
  - : Giả sử chúng ta được giao nhiệm vụ tạo một bằng chứng khái niệm trong React – một ứng dụng cho phép người dùng thêm, chỉnh sửa và xóa các tác vụ họ muốn thực hiện, đồng thời đánh dấu các tác vụ là hoàn thành mà không xóa chúng. Bài viết này sẽ hướng dẫn bạn thiết lập cấu trúc và kiểu dáng cơ bản của thành phần `App`, sẵn sàng cho định nghĩa thành phần riêng lẻ và tính tương tác mà chúng ta sẽ thêm sau.
- [Phân chia ứng dụng React của chúng ta thành các thành phần](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_components)
  - : Tại thời điểm này, ứng dụng của chúng ta là một khối đơn lẻ. Trước khi chúng ta có thể làm cho nó hoạt động, chúng ta cần chia nhỏ nó thành các thành phần có thể quản lý và mô tả được. React không có quy tắc cứng nhắc nào về thành phần là gì và không phải là gì — điều đó tùy thuộc vào bạn! Trong bài viết này, chúng tôi sẽ chỉ cho bạn một cách hợp lý để chia ứng dụng của chúng ta thành các thành phần.
- [Tính tương tác React: Sự kiện và trạng thái](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state)
  - : Với kế hoạch thành phần đã được xây dựng, đã đến lúc bắt đầu cập nhật ứng dụng của chúng ta từ giao diện người dùng hoàn toàn tĩnh sang giao diện thực sự cho phép chúng ta tương tác và thay đổi mọi thứ. Trong bài viết này, chúng tôi sẽ làm điều này, đồng thời đào sâu vào sự kiện và trạng thái.
- [Tính tương tác React: Chỉnh sửa, lọc, kết xuất có điều kiện](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering)
  - : Khi chúng ta gần đến cuối hành trình React (ít nhất là hiện tại), chúng ta sẽ thêm những điểm hoàn thiện cho các khu vực chức năng chính trong ứng dụng danh sách việc cần làm của chúng ta. Điều này bao gồm cho phép bạn chỉnh sửa các tác vụ hiện có và lọc danh sách tác vụ giữa tất cả, đã hoàn thành và chưa hoàn thành. Chúng ta sẽ xem xét kết xuất giao diện người dùng có điều kiện trong quá trình đó.
- [Khả năng tiếp cận trong React](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_accessibility)
  - : Trong bài viết hướng dẫn cuối cùng của chúng ta, chúng tôi sẽ tập trung vào khả năng tiếp cận, bao gồm quản lý tiêu điểm trong React, có thể cải thiện khả năng sử dụng và giảm sự nhầm lẫn cho cả người dùng chỉ dùng bàn phím và trình đọc màn hình.
- [Tài nguyên React](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_resources)
  - : Bài viết cuối cùng của chúng tôi cung cấp cho bạn danh sách các tài nguyên React mà bạn có thể sử dụng để tiếp tục học tập.

## Các lựa chọn framework khác

### Hướng dẫn Ember

> [!NOTE]
> Các hướng dẫn Ember được kiểm tra lần cuối vào tháng 5 năm 2020, với Ember/Ember CLI phiên bản 3.18.0.
>
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm phiên bản hoàn chỉnh của code ứng dụng Ember mẫu trong [kho lưu trữ ember-todomvc-tutorial](https://github.com/NullVoxPopuli/ember-todomvc-tutorial/tree/master/steps/00-finished-todomvc/todomvc). Để xem phiên bản chạy trực tiếp, hãy xem <https://nullvoxpopuli.github.io/ember-todomvc-tutorial/> (điều này cũng bao gồm một vài tính năng bổ sung không được đề cập trong hướng dẫn).

- [Bắt đầu với Ember](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_getting_started)
  - : Trong bài viết Ember đầu tiên của chúng tôi, chúng ta sẽ xem xét cách Ember hoạt động và nó hữu ích cho điều gì, cài đặt chuỗi công cụ Ember cục bộ, tạo ứng dụng mẫu, rồi thực hiện một số thiết lập ban đầu để chuẩn bị cho phát triển.
- [Cấu trúc ứng dụng Ember và phân chia thành phần](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization)
  - : Trong bài viết này, chúng ta sẽ bắt tay vào lập kế hoạch cấu trúc ứng dụng TodoMVC Ember, thêm HTML cho nó, rồi chia cấu trúc HTML đó thành các thành phần.
- [Tính tương tác Ember: Sự kiện, lớp và trạng thái](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state)
  - : Tại thời điểm này, chúng ta sẽ bắt đầu thêm một số tính tương tác vào ứng dụng của mình, cung cấp khả năng thêm và hiển thị các mục việc cần làm mới. Trong quá trình đó, chúng ta sẽ xem xét cách sử dụng sự kiện trong Ember, tạo các lớp thành phần để chứa code JavaScript kiểm soát các tính năng tương tác, và thiết lập một dịch vụ để theo dõi trạng thái dữ liệu của ứng dụng.
- [Tính tương tác Ember: Chức năng footer, kết xuất có điều kiện](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer)
  - : Bây giờ là lúc bắt đầu giải quyết chức năng footer trong ứng dụng của chúng ta. Ở đây, chúng ta sẽ làm cho bộ đếm việc cần làm cập nhật để hiển thị số lượng việc cần làm đúng còn phải hoàn thành, và áp dụng kiểu dáng chính xác cho các việc cần làm đã hoàn thành. Chúng ta cũng sẽ kết nối nút "Xóa đã hoàn thành" của mình.
- [Định tuyến trong Ember](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_routing)
  - : Trong bài viết này, chúng ta tìm hiểu về định tuyến hoặc lọc dựa trên URL như đôi khi được gọi. Chúng ta sẽ sử dụng nó để cung cấp URL duy nhất cho mỗi trong ba chế độ xem việc cần làm — "Tất cả", "Đang hoạt động" và "Đã hoàn thành".
- [Tài nguyên và khắc phục sự cố Ember](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Ember_resources)
  - : Bài viết Ember cuối cùng của chúng tôi cung cấp cho bạn danh sách các tài nguyên bạn có thể sử dụng để tiếp tục học tập, cộng với một số thông tin khắc phục sự cố hữu ích và thông tin khác.

### Hướng dẫn Vue

> [!NOTE]
> Hướng dẫn Vue được kiểm tra lần cuối vào tháng 1 năm 2023, với Vue 3.2.45.
>
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm phiên bản hoàn chỉnh của code ứng dụng Vue mẫu trong [kho lưu trữ todo-vue](https://github.com/mdn/todo-vue) của chúng tôi. Để xem phiên bản chạy trực tiếp, hãy xem <https://mdn.github.io/todo-vue/>.

- [Bắt đầu với Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_getting_started)
  - : Bây giờ hãy giới thiệu Vue, framework thứ ba trong bộ của chúng ta. Trong bài viết này, chúng ta sẽ xem xét một chút về nền tảng của Vue, tìm hiểu cách cài đặt và tạo dự án mới, nghiên cứu cấu trúc cấp cao của toàn bộ dự án và một thành phần riêng lẻ, xem cách chạy dự án cục bộ và chuẩn bị bắt đầu xây dựng ví dụ của chúng ta.
- [Tạo thành phần Vue đầu tiên của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_first_component)
  - : Bây giờ là lúc đào sâu hơn vào Vue và tạo thành phần tùy chỉnh của riêng chúng ta — chúng ta sẽ bắt đầu bằng cách tạo một thành phần đại diện cho từng mục trong danh sách việc cần làm. Trong quá trình đó, chúng ta sẽ tìm hiểu về một số khái niệm quan trọng như gọi các thành phần bên trong các thành phần khác, truyền dữ liệu cho chúng thông qua props và lưu trạng thái dữ liệu.
- [Kết xuất danh sách các thành phần Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_rendering_lists)
  - : Tại thời điểm này, chúng ta có một thành phần hoạt động đầy đủ; bây giờ chúng ta đã sẵn sàng thêm nhiều thành phần `ToDoItem` vào ứng dụng. Trong bài viết này, chúng ta sẽ xem xét cách thêm một tập hợp dữ liệu mục việc cần làm vào thành phần `App.vue` của chúng ta, sau đó lặp qua và hiển thị trong các thành phần `ToDoItem` bằng chỉ thị `v-for`.
- [Thêm biểu mẫu việc cần làm mới: Sự kiện, phương thức và mô hình Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_methods_events_models)
  - : Chúng ta hiện đã có dữ liệu mẫu và một vòng lặp lấy từng phần dữ liệu và kết xuất nó bên trong `ToDoItem` trong ứng dụng. Điều chúng ta thực sự cần tiếp theo là khả năng cho phép người dùng nhập các mục việc cần làm của riêng họ vào ứng dụng, và cho điều đó, chúng ta sẽ cần một `<input>` văn bản, một sự kiện để kích hoạt khi dữ liệu được gửi, một phương thức để kích hoạt khi gửi để thêm dữ liệu và kết xuất lại danh sách, và một mô hình để kiểm soát dữ liệu.
- [Tạo kiểu cho thành phần Vue với CSS](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_styling)
  - : Cuối cùng đã đến lúc làm cho ứng dụng của chúng ta trông đẹp hơn một chút. Trong bài viết này, chúng ta sẽ khám phá các cách khác nhau để tạo kiểu cho thành phần Vue với CSS.
- [Sử dụng thuộc tính tính toán Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties)
  - : Trong bài viết này, chúng ta sẽ thêm bộ đếm hiển thị số lượng mục việc cần làm đã hoàn thành, sử dụng tính năng của Vue được gọi là thuộc tính tính toán. Chúng hoạt động tương tự như phương thức nhưng chỉ chạy lại khi một trong các phụ thuộc của chúng thay đổi.
- [Kết xuất có điều kiện Vue: Chỉnh sửa việc cần làm hiện có](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering)
  - : Bây giờ là lúc thêm một trong những phần chính của chức năng mà chúng ta vẫn còn thiếu — khả năng chỉnh sửa các mục việc cần làm hiện có. Để làm điều này, chúng ta sẽ tận dụng khả năng kết xuất có điều kiện của Vue — cụ thể là `v-if` và `v-else` — để cho phép chúng ta chuyển đổi giữa chế độ xem mục việc cần làm hiện có và chế độ xem chỉnh sửa. Chúng ta cũng sẽ xem xét cách thêm chức năng để xóa các mục việc cần làm.
- [Tham chiếu Vue và phương thức vòng đời để quản lý tiêu điểm](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management)
  - : Chúng ta gần xong với Vue. Phần chức năng cuối cùng cần xem xét là quản lý tiêu điểm, hay nói cách khác, cách chúng ta có thể cải thiện khả năng tiếp cận bàn phím của ứng dụng. Chúng ta sẽ xem xét cách sử dụng tham chiếu (ref) Vue để xử lý điều này — một tính năng nâng cao cho phép bạn có quyền truy cập trực tiếp vào các nút DOM cơ bản bên dưới DOM ảo, hoặc truy cập trực tiếp từ một thành phần vào cấu trúc DOM nội bộ của thành phần con.
- [Tài nguyên Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_resources)
  - : Bây giờ chúng ta sẽ hoàn tất nghiên cứu về Vue bằng cách cung cấp cho bạn danh sách các tài nguyên bạn có thể sử dụng để tiếp tục học, cộng với một số mẹo hữu ích khác.

### Hướng dẫn Svelte

> [!NOTE]
> Các hướng dẫn Svelte được kiểm tra lần cuối vào tháng 8 năm 2020, với Svelte 3.24.1.
>
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm phiên bản hoàn chỉnh của code ứng dụng Svelte mẫu sau mỗi bài viết trong [kho lưu trữ mdn-svelte-tutorial](https://github.com/opensas/mdn-svelte-tutorial) của chúng tôi. Để xem phiên bản chạy trực tiếp, hãy xem REPL Svelte của chúng tôi tại <https://svelte.dev/repl/378dd79e0dfe4486a8f10823f3813190?version=3.23.2>.

- [Bắt đầu với Svelte](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_getting_started)
  - : Trong bài viết này, chúng tôi sẽ cung cấp một giới thiệu nhanh về [framework Svelte](https://svelte.dev/). Chúng ta sẽ thấy Svelte hoạt động như thế nào và điều gì làm cho nó khác biệt so với các framework và công cụ khác mà chúng ta đã thấy. Sau đó, chúng ta sẽ học cách thiết lập môi trường phát triển, tạo ứng dụng mẫu, hiểu cấu trúc của dự án, và xem cách chạy cục bộ và xây dựng cho production.
- [Bắt đầu ứng dụng danh sách Todo Svelte của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_Todo_list_beginning)
  - : Bây giờ chúng ta đã có hiểu biết cơ bản về cách mọi thứ hoạt động trong Svelte, chúng ta có thể bắt đầu xây dựng ứng dụng ví dụ: một danh sách việc cần làm. Trong bài viết này, trước tiên chúng ta sẽ xem xét chức năng mong muốn của ứng dụng, sau đó chúng ta sẽ tạo thành phần `Todos.svelte` và đặt đánh dấu tĩnh và các kiểu vào đúng chỗ.
- [Hành vi động trong Svelte: làm việc với biến và props](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props)
  - : Bây giờ chúng ta đã có đánh dấu và kiểu sẵn sàng, chúng ta có thể bắt đầu phát triển các tính năng cần thiết cho ứng dụng danh sách To-Do Svelte của chúng ta. Trong bài viết này, chúng ta sẽ sử dụng biến và props để làm cho ứng dụng của chúng ta động, cho phép chúng ta thêm và xóa việc cần làm, đánh dấu chúng là hoàn thành và lọc chúng theo trạng thái.
- [Phân chia ứng dụng Svelte của chúng ta thành thành phần](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_components)
  - : Mục tiêu trung tâm của bài viết này là xem xét cách chia ứng dụng của chúng ta thành các thành phần có thể quản lý và chia sẻ thông tin giữa chúng. Chúng ta sẽ phân chia ứng dụng thành các thành phần, sau đó thêm nhiều chức năng hơn để cho phép người dùng cập nhật các thành phần hiện có.
- [Svelte nâng cao: Tính phản ứng, vòng đời, khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility)
  - : Trong bài viết này, chúng ta sẽ thêm các tính năng cuối cùng của ứng dụng và phân chia thêm ứng dụng. Chúng ta sẽ học cách xử lý các vấn đề tính phản ứng liên quan đến việc cập nhật đối tượng và mảng. Để tránh những sai lầm phổ biến, chúng ta sẽ phải đào sâu hơn vào hệ thống tính phản ứng của Svelte.
- [Làm việc với Svelte stores](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_stores)
  - : Trong bài viết này, chúng ta sẽ chỉ ra một cách khác để xử lý quản lý trạng thái trong Svelte — [Stores](https://learn.svelte.dev/tutorial/writable-stores). Stores là các kho dữ liệu toàn cục giữ các giá trị. Các thành phần có thể đăng ký nhận thông báo từ stores và nhận thông báo khi giá trị của chúng thay đổi.
- [Hỗ trợ TypeScript trong Svelte](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript)
  - : Bây giờ chúng ta sẽ học cách sử dụng TypeScript trong các ứng dụng Svelte. Đầu tiên chúng ta sẽ học TypeScript là gì và những lợi ích mà nó có thể mang lại. Sau đó chúng ta sẽ xem cách cấu hình dự án để làm việc với các tệp TypeScript. Cuối cùng, chúng ta sẽ xem xét ứng dụng và những sửa đổi nào cần thực hiện để tận dụng đầy đủ các tính năng TypeScript.
- [Triển khai và các bước tiếp theo](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_deployment_next)
  - : Trong bài viết cuối cùng này, chúng ta sẽ xem xét cách triển khai ứng dụng và đưa nó lên mạng, đồng thời chia sẻ một số tài nguyên mà bạn nên tham khảo để tiếp tục hành trình học Svelte.

### Hướng dẫn Angular

> [!NOTE]
> Các hướng dẫn Angular được kiểm tra lần cuối vào tháng 4 năm 2021, với Angular CLI (NG) 11.2.5.

- [Bắt đầu với Angular](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_getting_started)
  - : Trong bài viết này, chúng ta xem xét những gì Angular có thể cung cấp, cài đặt các điều kiện tiên quyết và thiết lập ứng dụng mẫu, và xem xét kiến trúc cơ bản của Angular.
- [Bắt đầu ứng dụng danh sách todo Angular của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning)
  - : Tại thời điểm này, chúng ta đã sẵn sàng bắt đầu tạo ứng dụng danh sách việc cần làm bằng Angular. Ứng dụng hoàn chỉnh sẽ hiển thị danh sách các mục việc cần làm và bao gồm các tính năng chỉnh sửa, xóa và thêm. Trong bài viết này, bạn sẽ làm quen với cấu trúc ứng dụng và xây dựng để hiển thị danh sách cơ bản các mục việc cần làm.
- [Tạo kiểu cho ứng dụng Angular của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_styling)
  - : Bây giờ chúng ta đã thiết lập cấu trúc ứng dụng cơ bản và bắt đầu hiển thị thứ gì đó hữu ích, hãy chuyển hướng và dành một bài viết để xem Angular xử lý tạo kiểu ứng dụng như thế nào.
- [Tạo thành phần mục](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_item_component)
  - : Các thành phần cung cấp một cách để bạn tổ chức ứng dụng của mình. Bài viết này hướng dẫn bạn tạo một thành phần để xử lý các mục riêng lẻ trong danh sách và thêm chức năng kiểm tra, chỉnh sửa và xóa. Mô hình sự kiện Angular được đề cập ở đây.
- [Lọc các mục việc cần làm của chúng ta](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_filtering)
  - : Bây giờ hãy chuyển sang thêm chức năng để cho phép người dùng lọc các mục việc cần làm, để họ có thể xem các mục đang hoạt động, đã hoàn thành hoặc tất cả các mục.
- [Xây dựng ứng dụng Angular và tài nguyên thêm](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_building)
  - : Bài viết Angular cuối cùng này đề cập đến cách xây dựng ứng dụng sẵn sàng cho production và cung cấp các tài nguyên thêm để bạn tiếp tục hành trình học tập.

## Chúng tôi đã chọn framework nào?

Chúng tôi đề cập đến năm framework trong các hướng dẫn của mình — Angular, Ember, React/ReactDOM, Svelte và Vue:

- Chúng là những lựa chọn phổ biến sẽ tồn tại lâu dài — giống như với bất kỳ công cụ phần mềm nào, tốt hơn là nên gắn bó với những lựa chọn đang được phát triển tích cực, ít có khả năng bị ngừng sử dụng vào tuần tới, và sẽ là những bổ sung đáng mong đợi cho bộ kỹ năng của bạn khi tìm kiếm việc làm.
- Chúng có cộng đồng mạnh và tài liệu tốt. Rất quan trọng khi có thể nhận được trợ giúp khi học một chủ đề phức tạp, đặc biệt khi bạn mới bắt đầu.
- Chúng tôi không có tài nguyên để đề cập đến _tất cả_ các framework hiện đại. Danh sách đó sẽ rất khó để cập nhật anyway, vì các framework mới xuất hiện liên tục.
- Là người mới bắt đầu, việc cố gắng chọn những gì cần tập trung từ số lượng lớn các lựa chọn có sẵn là vấn đề thực sự. Giữ danh sách ngắn do đó là điều hữu ích.

Chúng tôi muốn nói điều này rõ ràng — chúng tôi **không** chọn các framework mà chúng tôi đang tập trung vì chúng tôi nghĩ chúng là tốt nhất, hoặc vì chúng tôi tán thành chúng theo bất kỳ cách nào. Chúng tôi chỉ nghĩ rằng chúng đạt điểm cao theo các tiêu chí trên.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Introduction", "Learn_web_development/Core")}}
