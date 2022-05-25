using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KillScore : MonoBehaviour
{
    void OnEnable()
    {
        GetComponent<UnityEngine.UI.Text>().text = PlayerPrefs.GetInt("CurrentKills", 0).ToString();
    }
}
