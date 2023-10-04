$(document).ready(function () {
            const maxCharsPerLine = 50;
            const maxLines = 10;
            const CommentMaxLength = 400;

            $('#comment-textarea').on('input', function () {
                let lines = $(this).val().split('\n');

                if (lines.length > maxLines) {
                    lines = lines.slice(0, maxLines);
                }

                lines = lines.map(function (line) {
                    if (line.length > maxCharsPerLine) {
                        return line.slice(0, maxCharsPerLine);
                    }
                    return line;
                });

                const formattedText = lines.join('\n');
                $(this).val(formattedText);

                if (formattedText.length > CommentMaxLength) {
                    alert("400자 이내로 입력해주세요.");
                }
            });
        });