package com.example.laboratorul1

//by default
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
// Included by me
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Save views in variables
        val calculate = findViewById(R.id.calculate_button) as Button
        val inputText = findViewById(R.id.input_textView) as TextView
        val result = findViewById(R.id.result_textView) as TextView

        // On click of calculate:
        calculate.setOnClickListener {
            // Transform the text in string, split it when is space (\\s) and save it in an array in 'words'
            val words = inputText.text.toString().split("\\s".toRegex()).toTypedArray()
            // Count how many filtered 'words' that contains letter 'a' are, then convert in String and save the result in 'result'
            result.text = words.filter { x -> x.contains("a".toRegex()) }.count().toString()        }
    }
}

