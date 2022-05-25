using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CoinsUpdation : MonoBehaviour
{
    Text CoinsTxt; 
    // Start is called before the first frame update
    void Start()
    {
        CoinsTxt = GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        CoinsTxt.text = PlayerPrefs.GetInt("TotalCoins",0).ToString();
    }
    public void AddCoins()
    {
        PlayerPrefs.SetInt("TotalCoins", PlayerPrefs.GetInt("TotalCoins", 0) + 100);
    }
}
