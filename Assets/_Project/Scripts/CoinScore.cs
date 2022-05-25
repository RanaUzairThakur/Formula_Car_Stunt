using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CoinScore : MonoBehaviour
{    void OnEnable()
    {
        GetComponent<UnityEngine.UI.Text>().text = (PlayerPrefs.GetInt("CurrentKills", 0)*125).ToString();
        PlayerPrefs.SetInt("TotalCoins", PlayerPrefs.GetInt("TotalCoins", 0)+(PlayerPrefs.GetInt("CurrentKills", 0) * 125));
    }
}
