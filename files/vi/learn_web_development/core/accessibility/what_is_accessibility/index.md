---
title: Khả năng tiếp cận là gì?
slug: Learn_web_development/Core/Accessibility/What_is_accessibility
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Accessibility/Tooling", "Learn_web_development/Core/Accessibility")}}

Bài viết này bắt đầu mô-đun với một cái nhìn toàn diện về khả năng tiếp cận — tổng quan này bao gồm những nhóm người chúng ta cần xem xét và tại sao, những công cụ khác nhau mà mọi người sử dụng để tương tác với web, và cách chúng ta có thể đưa khả năng tiếp cận vào quy trình phát triển web của mình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Ý nghĩa của khả năng tiếp cận — tăng khả năng tiếp cận dịch vụ kỹ thuật số cho những người có nhu cầu bổ sung, cải thiện khả năng sử dụng cho mọi người, SEO tốt hơn và đối tượng mục tiêu rộng hơn.</li>
          <li>Nhận thức về các yêu cầu pháp lý về khả năng tiếp cận.</li>
          <li>Khả năng tiếp cận nên được xem xét ngay từ đầu dự án, chứ không phải thêm vào ở cuối.</li>
          <li>Quen thuộc với tiêu chí tuân thủ của Hướng dẫn khả năng tiếp cận nội dung web (WCAG).</li>
          <li>Nhận thức về các API khả năng tiếp cận và mục đích của chúng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Vậy khả năng tiếp cận là gì?

Khả năng tiếp cận là thực hành làm cho trang web của bạn có thể sử dụng được bởi càng nhiều người càng tốt. Chúng ta thường nghĩ về điều này như liên quan đến người khuyết tật, nhưng thực hành làm cho trang web dễ tiếp cận cũng mang lại lợi ích cho các nhóm khác như những người sử dụng thiết bị di động, hoặc những người có kết nối mạng chậm.

Bạn cũng có thể nghĩ về khả năng tiếp cận như đối xử với mọi người như nhau và cho họ cơ hội bình đẳng, bất kể khả năng hay hoàn cảnh của họ là gì. Cũng giống như việc không cho phép ai đó vào một tòa nhà vì họ ngồi xe lăn là sai trái (các tòa nhà công cộng hiện đại thường có đường dốc hoặc thang máy dành cho xe lăn), việc không cho phép ai đó truy cập trang web vì họ bị suy giảm thị giác cũng là không đúng. Chúng ta đều khác nhau, nhưng chúng ta đều là con người, và vì vậy có quyền con người như nhau.

Khả năng tiếp cận là điều đúng đắn cần làm. Cung cấp các trang web dễ tiếp cận là một phần của pháp luật ở một số quốc gia, điều này có thể mở ra một số thị trường đáng kể mà nếu không thì không thể sử dụng dịch vụ của bạn hoặc mua sản phẩm của bạn.

Xây dựng các trang web dễ tiếp cận mang lại lợi ích cho mọi người:

- HTML ngữ nghĩa, cải thiện khả năng tiếp cận, cũng cải thiện SEO, làm cho trang web của bạn dễ tìm thấy hơn.
- Quan tâm đến khả năng tiếp cận thể hiện đạo đức và đạo lý tốt, điều này cải thiện hình ảnh công chúng của bạn.
- Các thực hành tốt khác cải thiện khả năng tiếp cận cũng làm cho trang web của bạn dễ sử dụng hơn cho các nhóm khác, chẳng hạn như người dùng điện thoại di động hoặc những người có tốc độ mạng thấp. Thực tế, mọi người đều có thể được hưởng lợi từ nhiều cải tiến như vậy.
- Chúng tôi đã đề cập rằng đây cũng là pháp luật ở một số nơi không?

## Những loại khuyết tật nào chúng ta đang xem xét?

Người khuyết tật cũng đa dạng như người không có khuyết tật, và khuyết tật của họ cũng vậy. Bài học chính ở đây là nghĩ xa hơn máy tính của bạn và cách bạn sử dụng web, và bắt đầu tìm hiểu cách người khác sử dụng nó — _bạn không phải là người dùng của bạn_. Các loại khuyết tật chính cần xem xét được giải thích dưới đây, cùng với bất kỳ công cụ đặc biệt nào họ sử dụng để truy cập nội dung web (được gọi là **công nghệ hỗ trợ**, hay **AT**).

> [!NOTE]
> Tờ thông tin [Khuyết tật và sức khỏe](https://www.who.int/en/news-room/fact-sheets/detail/disability-and-health) của Tổ chức Y tế Thế giới cho biết "Hơn một tỷ người, khoảng 15% dân số thế giới, có một dạng khuyết tật nào đó", và "Từ 110 triệu đến 190 triệu người trưởng thành có khó khăn đáng kể trong hoạt động."

### Người bị suy giảm thị giác

Người bị suy giảm thị giác bao gồm những người mù, thị lực thấp, và mù màu. Nhiều người bị suy giảm thị giác sử dụng kính lúp màn hình, có thể là kính lúp vật lý hoặc tính năng phóng to phần mềm. Hầu hết các trình duyệt và hệ điều hành ngày nay đều có tính năng phóng to. Một số người dùng sẽ phụ thuộc vào trình đọc màn hình, đây là phần mềm đọc to văn bản kỹ thuật số. Một số ví dụ về trình đọc màn hình bao gồm:

- Sản phẩm thương mại có trả phí, như [JAWS](https://vispero.com/jaws-screen-reader-software/) (Windows) và [Dolphin Screen Reader](https://yourdolphin.com/ScreenReader) (Windows).
- Sản phẩm miễn phí, như [NVDA](https://www.nvaccess.org/) (Windows), [ChromeVox](https://support.google.com/chromebook/answer/7031755) (Chrome), và [Orca](https://wiki.gnome.org/Projects/Orca) (Linux).
- Phần mềm được tích hợp vào hệ điều hành, như [VoiceOver](https://www.apple.com/accessibility/features/?vision) (macOS, iPadOS, iOS), [Narrator](https://support.microsoft.com/en-us/windows/complete-guide-to-narrator-e4397a0d-ef4f-b386-d8ae-c172f109bdb1) (Windows), [ChromeVox](https://support.google.com/chromebook/answer/7031755) (trên ChromeOS), và [TalkBack](https://play.google.com/store/apps/details?id=com.google.android.marvin.talkback) (Android).

Việc làm quen với các trình đọc màn hình là ý hay; bạn cũng nên thiết lập một trình đọc màn hình và thử nghiệm với nó, để hiểu cách nó hoạt động. Xem [hướng dẫn trình đọc màn hình](/en-US/docs/Learn_web_development/Core/Accessibility/Tooling#screen_readers) của chúng tôi để biết thêm chi tiết về cách sử dụng chúng. Video bên dưới cũng cung cấp một ví dụ ngắn gọn về trải nghiệm như thế nào.

{{EmbedYouTube("IK97XMibEws")}}

Về mặt thống kê, Tổ chức Y tế Thế giới ước tính rằng "285 triệu người ước tính bị suy giảm thị giác trên toàn thế giới: 39 triệu người mù và 246 triệu người có thị lực thấp." (xem [Suy giảm thị giác và mù lòa](https://www.who.int/en/news-room/fact-sheets/detail/blindness-and-visual-impairment)). Đó là một lượng lớn và đáng kể người dùng bỏ lỡ chỉ vì trang web của bạn không được mã hóa đúng cách — gần bằng dân số của Hoa Kỳ.

### Người bị suy giảm thính giác

[Người điếc và khiếm thính (DHH)](https://www.nad.org/resources/american-sign-language/community-and-culture-frequently-asked-questions/) có nhiều mức độ mất thính lực khác nhau từ nhẹ đến sâu. Mặc dù một số người sử dụng AT (xem [Thiết bị hỗ trợ cho người có rối loạn thính giác, giọng nói, lời nói, hoặc ngôn ngữ](https://www.nidcd.nih.gov/health/assistive-devices-people-hearing-voice-speech-or-language-disorders)), chúng không phổ biến rộng rãi.

Để cung cấp khả năng truy cập, cần cung cấp các phương án thay thế bằng văn bản. Video nên được phụ đề thủ công, và bản ghi âm nên được cung cấp cho nội dung âm thanh. Hơn nữa, do mức độ cao của [thiếu hụt ngôn ngữ](https://epicspecialeducationstaffing.com/language-deprivation/#:~:text=Language%20deprivation%20is%20the%20term,therefore%20not%20exposed%20to%20language.) trong cộng đồng DHH, [cần xem xét đơn giản hóa văn bản](https://circlcenter.org/collaborative-research-automatic-text-simplification-and-reading-assistance-to-support-self-directed-learning-by-deaf-and-hard-of-hearing-computing-workers/).

Người điếc và khiếm thính cũng đại diện cho một cơ sở người dùng đáng kể — "466 triệu người trên toàn thế giới bị mất thính lực gây khuyết tật", theo tờ thông tin [Điếc và mất thính lực](https://www.who.int/en/news-room/fact-sheets/detail/deafness-and-hearing-loss) của Tổ chức Y tế Thế giới.

### Người bị suy giảm vận động

Những người này có khuyết tật liên quan đến chuyển động, có thể liên quan đến các vấn đề thể chất thuần túy (chẳng hạn như mất chi hoặc liệt), hoặc các rối loạn thần kinh/di truyền dẫn đến suy yếu hoặc mất kiểm soát ở các chi. Một số người có thể gặp khó khăn khi thực hiện các chuyển động tay chính xác cần thiết để sử dụng chuột, trong khi những người khác có thể bị ảnh hưởng nặng hơn, có thể bị liệt đáng kể đến mức họ cần sử dụng [con trỏ đầu](https://www.performancehealth.com/adjustable-headpointer) để tương tác với máy tính.

Loại khuyết tật này cũng có thể là kết quả của tuổi tác, chứ không phải bất kỳ chấn thương hoặc tình trạng cụ thể nào, và cũng có thể do hạn chế phần cứng — một số người dùng có thể không có chuột.

Cách điều này thường ảnh hưởng đến công việc phát triển web là yêu cầu các điều khiển phải có thể truy cập bằng bàn phím — chúng ta sẽ thảo luận về khả năng tiếp cận bằng bàn phím trong các bài viết sau trong mô-đun, nhưng đó là ý tưởng hay khi thử một số trang web chỉ sử dụng bàn phím để xem bạn làm như thế nào. Ví dụ, bạn có thể sử dụng phím Tab để di chuyển giữa các điều khiển khác nhau của biểu mẫu web không? Bạn có thể tìm thêm chi tiết về điều khiển bàn phím trong phần [Sử dụng điều khiển UI ngữ nghĩa khi có thể](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible) của chúng tôi.

Về mặt thống kê, một số lượng đáng kể người bị suy giảm vận động. Trung tâm kiểm soát và phòng ngừa dịch bệnh Hoa Kỳ [Khuyết tật và chức năng (Người trưởng thành không trong tổ chức từ 18 tuổi trở lên)](https://www.cdc.gov/nchs/fastats/disability.htm) báo cáo rằng Hoa Kỳ "Tỷ lệ người trưởng thành có bất kỳ khó khăn chức năng thể chất nào: 16,1%".

### Người bị suy giảm nhận thức

Suy giảm nhận thức đề cập đến một loạt các khuyết tật, từ những người có khuyết tật trí tuệ với khả năng hạn chế nhất, đến tất cả chúng ta khi già đi và có khó khăn trong suy nghĩ và ghi nhớ. Phạm vi này bao gồm những người mắc bệnh tâm thần, chẳng hạn như [trầm cảm](https://www.nimh.nih.gov/health/topics/depression) và [tâm thần phân liệt](https://www.nimh.nih.gov/health/topics/schizophrenia). Nó cũng bao gồm những người có khuyết tật học tập, chẳng hạn như [chứng khó đọc](https://www.nichd.nih.gov/health/topics/learningdisabilities) và [rối loạn tăng động giảm chú ý](https://www.nimh.nih.gov/health/topics/attention-deficit-hyperactivity-disorder-adhd). Quan trọng là, mặc dù có nhiều sự đa dạng trong các định nghĩa lâm sàng về suy giảm nhận thức, những người mắc phải chúng trải nghiệm một tập hợp chung các vấn đề chức năng. Những điều này bao gồm khó khăn trong việc hiểu nội dung, nhớ cách hoàn thành các nhiệm vụ, và nhầm lẫn do bố cục trang web không nhất quán.

Một nền tảng tốt về khả năng tiếp cận cho người bị suy giảm nhận thức bao gồm:

- Cung cấp nội dung theo nhiều cách, chẳng hạn như bằng chuyển văn bản thành giọng nói hoặc video.
- Nội dung dễ hiểu, chẳng hạn như văn bản được viết theo tiêu chuẩn ngôn ngữ đơn giản.
- Tập trung sự chú ý vào nội dung quan trọng.
- Giảm thiểu các yếu tố gây mất tập trung, chẳng hạn như nội dung không cần thiết hoặc quảng cáo.
- Bố cục trang web và điều hướng nhất quán.
- Các phần tử quen thuộc, chẳng hạn như liên kết gạch chân màu xanh lam khi chưa truy cập và màu tím khi đã truy cập.
- Chia quy trình thành các bước hợp lý, thiết yếu với chỉ báo tiến trình.
- Xác thực trang web dễ dàng nhất có thể mà không ảnh hưởng đến bảo mật.
- Làm cho biểu mẫu dễ hoàn thành, chẳng hạn với thông báo lỗi rõ ràng và khôi phục lỗi đơn giản.

### Ghi chú

- Thiết kế với [khả năng tiếp cận nhận thức](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility) sẽ dẫn đến các thực hành thiết kế tốt. Chúng sẽ mang lại lợi ích cho mọi người.
- Nhiều người bị suy giảm nhận thức cũng có khuyết tật thể chất. Các trang web phải tuân theo [Hướng dẫn khả năng tiếp cận nội dung web](https://www.w3.org/WAI/standards-guidelines/wcag/) của W3C, bao gồm [hướng dẫn khả năng tiếp cận nhận thức](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility#wcag_guidelines).
- [Nhóm công tác khả năng tiếp cận của người khuyết tật nhận thức và học tập](https://www.w3.org/WAI/GL/task-forces/coga/) của W3C tạo ra các hướng dẫn khả năng tiếp cận web cho người bị suy giảm nhận thức.
- WebAIM có [trang Nhận thức](https://webaim.org/articles/cognitive/) với thông tin và tài nguyên liên quan.
- Trung tâm kiểm soát dịch bệnh Hoa Kỳ ước tính rằng, tính đến năm 2018, 1 trong 4 công dân Hoa Kỳ có khuyết tật và trong số đó, [suy giảm nhận thức là phổ biến nhất đối với người trẻ](https://archive.cdc.gov/www_cdc_gov/media/releases/2018/p0816-disability.html).
- Tại Hoa Kỳ, một số khuyết tật trí tuệ trong lịch sử đã được gọi là "chậm phát triển tâm thần." Nhiều người hiện coi thuật ngữ này là xúc phạm, vì vậy nên tránh sử dụng nó.
- Tại Vương quốc Anh, một số khuyết tật trí tuệ được gọi là "khuyết tật học tập" hoặc "khó khăn học tập".

## Triển khai khả năng tiếp cận vào dự án của bạn

Một quan niệm sai lầm phổ biến về khả năng tiếp cận là đó là một "phần bổ sung" tốn kém để triển khai trong một dự án. Quan niệm sai lầm này thực sự _có thể_ đúng nếu:

- Bạn đang cố gắng "cải tạo" khả năng tiếp cận trên một trang web hiện có có các vấn đề khả năng tiếp cận đáng kể.
- Bạn chỉ mới bắt đầu xem xét khả năng tiếp cận và phát hiện ra các vấn đề liên quan ở giai đoạn cuối của dự án.

Tuy nhiên, nếu bạn xem xét khả năng tiếp cận từ đầu dự án, chi phí làm cho hầu hết nội dung dễ tiếp cận sẽ khá tối thiểu.

Khi lập kế hoạch dự án, hãy tích hợp kiểm tra khả năng tiếp cận vào chế độ kiểm tra của bạn, giống như kiểm tra cho bất kỳ phân khúc đối tượng mục tiêu quan trọng nào khác (ví dụ: trình duyệt máy tính để bàn hoặc thiết bị di động mục tiêu). Kiểm tra sớm và thường xuyên, lý tưởng là chạy các bài kiểm tra tự động để phát hiện các tính năng bị thiếu có thể phát hiện theo chương trình (chẳng hạn như thiếu [văn bản thay thế](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives) cho hình ảnh hoặc văn bản liên kết xấu — xem [Sử dụng nhãn văn bản có ý nghĩa](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels)) và thực hiện một số kiểm tra với các nhóm người dùng khuyết tật để xem các tính năng trang web phức tạp hơn hoạt động tốt như thế nào đối với họ. Ví dụ:

- Widget chọn ngày của tôi có thể sử dụng được bởi người dùng trình đọc màn hình không?
- Nếu nội dung cập nhật động, người khiếm thị có biết về điều đó không?
- Các nút UI của tôi có thể truy cập được cho cả người dùng bàn phím lẫn giao diện cảm ứng không?

Bạn có thể và nên ghi chú về các khu vực có vấn đề tiềm năng trong nội dung của mình cần được làm việc để có thể truy cập, hãy đảm bảo rằng nó được kiểm tra kỹ lưỡng, và suy nghĩ về các giải pháp/phương án thay thế. Nội dung văn bản (như bạn sẽ thấy trong bài viết tiếp theo) rất dễ dàng, nhưng về nội dung đa phương tiện và đồ họa 3D ấn tượng của bạn thì sao? Bạn nên xem xét ngân sách dự án và suy nghĩ về những giải pháp bạn có sẵn để làm cho nội dung đó dễ tiếp cận. Việc sao chép toàn bộ nội dung đa phương tiện của bạn là một tùy chọn, tuy đắt tiền nhưng có thể thực hiện được.

Ngoài ra, hãy thực tế. "100% khả năng tiếp cận" là một lý tưởng không thể đạt được — bạn sẽ luôn gặp phải một số trường hợp ngoại lệ dẫn đến một người dùng nhất định gặp khó khăn khi sử dụng nội dung nhất định — nhưng bạn nên làm hết sức mình. Nếu bạn đang lên kế hoạch đưa vào một đồ họa biểu đồ hình tròn 3D ấn tượng được tạo bằng WebGL, bạn có thể muốn bao gồm một bảng dữ liệu như là một biểu diễn thay thế dễ tiếp cận của dữ liệu. Hoặc, bạn có thể muốn chỉ bao gồm bảng và loại bỏ biểu đồ hình tròn 3D — bảng có thể truy cập được bởi mọi người, nhanh hơn để mã hóa, ít CPU hơn và dễ bảo trì hơn.

Mặt khác, nếu bạn đang làm việc trên một trang web trưng bày nghệ thuật 3D thú vị, sẽ không hợp lý khi mong đợi mọi tác phẩm nghệ thuật phải hoàn toàn dễ tiếp cận với người khiếm thị, vì đó là phương tiện hoàn toàn thị giác.

Để cho thấy rằng bạn quan tâm và đã suy nghĩ về khả năng tiếp cận, hãy xuất bản một tuyên bố về khả năng tiếp cận trên trang web của bạn nêu rõ chính sách của bạn đối với khả năng tiếp cận, và những bước bạn đã thực hiện để làm cho trang web dễ tiếp cận. Nếu ai đó thông báo cho bạn rằng trang web của bạn có vấn đề về khả năng tiếp cận, hãy bắt đầu đối thoại với họ, đồng cảm và thực hiện các bước hợp lý để cố gắng khắc phục vấn đề.

Tóm lại:

- Xem xét khả năng tiếp cận từ đầu dự án, và kiểm tra sớm và thường xuyên. Giống như bất kỳ lỗi nào khác, một vấn đề về khả năng tiếp cận sẽ tốn kém hơn để sửa chữa khi phát hiện càng muộn.
- Hãy nhớ rằng nhiều thực hành tốt nhất về khả năng tiếp cận mang lại lợi ích cho mọi người, không chỉ người dùng khuyết tật. Ví dụ, đánh dấu ngữ nghĩa gọn gàng không chỉ tốt cho trình đọc màn hình, mà còn nhanh để tải và hiệu quả. Điều này mang lại lợi ích cho mọi người, đặc biệt là những người trên thiết bị di động và/hoặc kết nối chậm.
- Xuất bản tuyên bố về khả năng tiếp cận trên trang web của bạn và tương tác với những người gặp vấn đề.

## Hướng dẫn về khả năng tiếp cận và pháp luật

Có nhiều danh sách kiểm tra và bộ hướng dẫn có sẵn để dựa trên các bài kiểm tra khả năng tiếp cận, điều này có thể có vẻ áp đảo lúc đầu nhìn. Lời khuyên của chúng tôi là hãy làm quen với các lĩnh vực cơ bản mà bạn cần chú ý, cũng như hiểu các cấu trúc cấp cao của các hướng dẫn có liên quan nhất đến bạn.

- Để bắt đầu, W3C đã xuất bản một tài liệu lớn và rất chi tiết bao gồm các tiêu chí rất chính xác, không phụ thuộc vào công nghệ cho sự tuân thủ khả năng tiếp cận. Chúng được gọi là [Hướng dẫn khả năng tiếp cận nội dung web](https://www.w3.org/WAI/standards-guidelines/wcag/) (WCAG), và chúng không hề ngắn. Các tiêu chí được chia thành bốn danh mục chính, xác định cách triển khai có thể được nhận thức, hoạt động, hiểu và mạnh mẽ. Nơi tốt nhất để bắt đầu tìm hiểu là [WCAG tóm tắt](https://www.w3.org/WAI/standards-guidelines/wcag/glance/). Không cần phải học tất cả các tiêu chí WCAG — hãy biết về các lĩnh vực quan tâm chính và sử dụng nhiều kỹ thuật và công cụ để làm nổi bật bất kỳ lĩnh vực nào không tuân thủ tiêu chí WCAG (xem bên dưới để biết thêm).
- Quốc gia của bạn cũng có thể có luật cụ thể quy định nhu cầu các trang web phục vụ dân số của họ phải dễ tiếp cận — ví dụ như [EN 301 549](https://www.etsi.org/deliver/etsi_en/301500_301599/301549/02.01.02_60/en_301549v020102p.pdf) ở EU, [Điều 508 của Đạo luật phục hồi chức năng](https://www.section508.gov/training/) ở Hoa Kỳ, [Nghị định liên bang về công nghệ thông tin không có rào cản](https://www.aktion-mensch.de/inklusion/barrierefreiheit/barrierefreie-website) ở Đức, [Quy định về khả năng tiếp cận 2018](https://www.legislation.gov.uk/uksi/2018/952/introduction/made) ở Vương quốc Anh, [Accessibilità](https://www.agid.gov.it/it/ambiti-intervento/accessibilita-usabilita) ở Ý, [Đạo luật phân biệt đối xử người khuyết tật](https://humanrights.gov.au/resource-hub/resources-for-organisations-businesses/disability-resources-employers/guidelines-equal-access-digital-goods-and-services) ở Úc, v.v. W3C duy trì danh sách [Luật và chính sách khả năng tiếp cận web](https://www.w3.org/WAI/policies/) theo quốc gia.

Vì vậy, trong khi WCAG là một bộ hướng dẫn, quốc gia của bạn có thể có các luật quy định về khả năng tiếp cận web, hoặc ít nhất là khả năng tiếp cận của các dịch vụ cung cấp cho công chúng (có thể bao gồm trang web, truyền hình, không gian vật lý, v.v.). Thật tốt khi biết luật của bạn là gì. Nếu bạn không nỗ lực kiểm tra rằng nội dung của bạn có thể truy cập được, bạn có thể bị truy cứu pháp lý nếu mọi người phàn nàn.

Điều này nghe có vẻ nghiêm trọng, nhưng thực sự bạn chỉ cần coi khả năng tiếp cận là ưu tiên chính của các thực hành phát triển web của mình, như đã nêu ở trên. Nếu còn nghi ngờ, hãy nhờ tư vấn từ luật sư có chuyên môn. Chúng tôi sẽ không đưa ra bất kỳ lời khuyên nào nhiều hơn điều này, vì chúng tôi không phải luật sư.

## API khả năng tiếp cận

Các trình duyệt web sử dụng các **API khả năng tiếp cận** đặc biệt (được cung cấp bởi hệ điều hành cơ bản) để hiển thị thông tin hữu ích cho các công nghệ hỗ trợ (AT) — AT chủ yếu có xu hướng sử dụng thông tin ngữ nghĩa, vì vậy thông tin này không bao gồm những thứ như thông tin kiểu dáng, hoặc JavaScript. Thông tin này được cấu trúc trong một cây thông tin được gọi là **cây khả năng tiếp cận**.

Các hệ điều hành khác nhau có các API khả năng tiếp cận khác nhau:

- Windows: MSAA/IAccessible, UIAExpress, IAccessible2
- macOS: NSAccessibility
- Linux: AT-SPI
- Android: Khung khả năng tiếp cận
- iOS: UIAccessibility

Khi thông tin ngữ nghĩa gốc được cung cấp bởi các phần tử HTML trong ứng dụng web của bạn không đủ, bạn có thể bổ sung bằng các tính năng từ [đặc tả WAI-ARIA](https://w3c.github.io/aria/), thêm thông tin ngữ nghĩa vào cây khả năng tiếp cận để cải thiện khả năng tiếp cận. Bạn có thể tìm hiểu thêm nhiều về WAI-ARIA trong bài viết [Kiến thức cơ bản về WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics) của chúng tôi.

## Tóm tắt

Bài viết này nên đã cho bạn một tổng quan hữu ích ở mức cao về khả năng tiếp cận, chỉ cho bạn thấy tại sao nó quan trọng, và nhìn vào cách bạn có thể tích hợp nó vào quy trình làm việc của mình. Bây giờ bạn cũng nên có mong muốn tìm hiểu về các chi tiết triển khai có thể làm cho các trang web dễ tiếp cận, và những công cụ nào có thể giúp ích. Chúng ta sẽ xem xét công cụ hỗ trợ khả năng tiếp cận trong bài viết tiếp theo.

## Xem thêm

- [WCAG](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG)
  - [Có thể nhận thức](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable)
  - [Có thể vận hành](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable)
  - [Có thể hiểu được](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable)
  - [Mạnh mẽ](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Robust)

- [Google Chrome đã phát hành tiện ích mở rộng tự động phụ đề](https://blog.google/products-and-platforms/products/chrome/live-caption-chrome/)

{{NextMenu("Learn_web_development/Core/Accessibility/Tooling", "Learn_web_development/Core/Accessibility")}}
