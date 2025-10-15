#!/bin/bash 
{
echo "Отчет о логе веб-сервера"
echo "========================"
echo "Общее количество запросов:      $(wc -l < access.log)"
echo "Количество уникальных IP-адресов:     $(awk '{print $1}' access.log | sort -u | wc -l)"
echo ""
echo "Количество запросов по методам:"
awk '{print $6}' access.log | tr -d '"' | sort | uniq -c 
echo ""
echo "Самый популярный URL:      $(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -1)"
} | tee report.txt
echo "Отчет сохранен в файл report.txt"
